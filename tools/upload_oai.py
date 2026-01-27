# pip install --upgrade openai
import json, os, time, uuid
from pathlib import Path
from openai import OpenAI

client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"))

# -----------------------------
# 1) Create a JSONL batch file
# -----------------------------
# Each line is a POST to /v1/responses with your usual request body.
# Use unique custom_id values to match outputs later.
tasks = []

FILE = 'general-prompt.rocq.jsonl'

with open(FILE, 'r') as f:
    for line in f:
        obj = json.loads(line)
        tasks.append({
            "custom_id": obj['index'],
            "method": "POST",
            "url": "/v1/responses",
            "body": {
                "model": "o4-mini",
                # Optional: a system-like instruction for the Responses API
                #"instructions": "Be concise and helpful.",
                # You can pass a simple string or a structured multi-part input.
                "input": obj['request'],
                "reasoning": {"effort": "high"},
                # Optional knobs:
                #"temperature": 0.7,
                "max_output_tokens": 25000,
                "text": {
                    "format": {
                        "type": "json_schema",
                        "name": "code",
                        "strict": True,
                        "schema": {
                            "type": "object",
                            "additionalProperties": False,
                            "properties":{"code":{"type":"string"}},
                            "required":["code"]
                        }
                    }
            }}
        })

# {
# "custom_id": "request-1",
# "method": "POST",
# "url": "/v1/chat/completions",
# "body": {
#   "model": "gpt-4o-mini",
#   "messages": [{"role": "system", "content": "You are a helpful assistant."}, {"role": "user", "content": "What is 2+2?"}]}}

# {
# "id": "batch_req_wnaDys",
# "custom_id": "request-2",
# "response": {
#   "status_code": 200,
#   "request_id": "req_c187b3",
#   "body": {
#       "id": "chatcmpl-9758Iw",
#       "object": "chat.completion", "created": 1711475054, "model": "gpt-4o-mini", "choices": [{"index": 0, "message": {"role": "assistant", "content": "2 + 2 equals 4."}, "finish_reason": "stop"}], "usage": {"prompt_tokens": 24, "completion_tokens": 15, "total_tokens": 39}, "system_fingerprint": null}}, "error": null}


batch_dir = Path("batch_artifacts")
batch_dir.mkdir(exist_ok=True)
input_path = batch_dir / f"request_batch_{FILE}"

with input_path.open("w", encoding="utf-8") as f:
    for task in tasks:
        f.write(json.dumps(task, ensure_ascii=False) + "\n")

print(f"Created batch input at: {input_path}")

# -----------------------------
# 2) Upload the batch file
# -----------------------------
uploaded = client.files.create(file=input_path, purpose="batch")
print("Uploaded file id:", uploaded.id)

# -----------------------------
# 3) Create the batch job
# -----------------------------
# endpoint must match the per-line "url" in the JSONL file.
batch = client.batches.create(
    input_file_id=uploaded.id,
    endpoint="/v1/responses",
    completion_window="24h",  # required value per docs
)
print("Batch id:", batch.id, "status:", batch.status)

# -----------------------------
# 4) Poll until completion
# -----------------------------
terminal_states = {"completed", "failed", "cancelling", "cancelled", "expired"}
while True:
    batch = client.batches.retrieve(batch.id)
    print("Batch status:", batch.status)
    if batch.status in terminal_states:
        break
    time.sleep(30)  # backoff as you like

#if batch.status != "completed":
#    # If it failed or was cancelled, try to fetch the error file (if present)
if batch.error_file_id:
    err_txt = client.files.content(batch.error_file_id).text
    (batch_dir / f"errors_{batch.id}.jsonl").write_text(err_txt, encoding="utf-8")
    print(f"Saved error lines to errors_{batch.id}.jsonl")
    raise SystemExit(f"Batch ended in state: {batch.status}")

# -----------------------------
# 5) Download the results file
# -----------------------------
result_file_id = batch.output_file_id
result_text = client.files.content(result_file_id).text
out_path = batch_dir / f"results_{batch.id}.jsonl"
out_path.write_text(result_text, encoding="utf-8")
print(f"Wrote results to: {out_path}")

# -----------------------------
# 6) Parse and print answers
# -----------------------------
def extract_output_text(body: dict) -> str:
    """
    The /v1/responses REST body returns an 'output' array.
    Each item can contain 'content' parts; we collect all 'output_text' pieces.
    The SDK's .output_text is a convenience in live calls, but batch files
    contain the raw REST JSON.
    """
    texts = []
    for item in (body.get("output") or []):
        for part in (item.get("content") or []):
            if part.get("type") == "output_text" and "text" in part:
                texts.append(part["text"])
    return "\n".join(texts).strip()

results_by_id = {}

with out_path.open("r", encoding="utf-8") as f:
    for line in f:
        obj = json.loads(line)
        cid = obj.get("custom_id")
        body = obj.get("response", {}).get("body", {})
        results_by_id[cid] = extract_output_text(body)

print("\n--- Batch outputs (custom_id -> text) ---")
# for cid, text in sorted(results_by_id.items()):
#     print(f"{cid}: {text}")
