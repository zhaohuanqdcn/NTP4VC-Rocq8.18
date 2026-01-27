#!/usr/bin/env python3
import os
import sys
import json


if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} <input-file> <output-file>")
    sys.exit(1)

file = sys.argv[1]
output_file = sys.argv[2]

FAIL = 0

PROMPTS = {}
with open("general-prompt.lean.jsonl", "r") as f:
    for line in f:
        obj = json.loads(line)
        PROMPTS[obj["index"]] = line

import re

def scan_code(text):
    # Find all code blocks with the specified languages
    pattern = r'```(?:isabelle|rocq|lean|lean4)?\s*\n(.*?)\n```'
    matches = re.findall(pattern, text, re.DOTALL | re.IGNORECASE)

    if matches:
        # Return the last match (most recent code block)
        return matches[-1].strip()
    else:
        return text

#with open("failed.jsonl", "w") as ffw:
with open(output_file, "w") as fw:
    with open(file, "r") as f:
        for i, line in enumerate(f):
            obj = json.loads(line)
            idx = obj["custom_id"]
            texts = []
            for output in obj["response"]["body"]["output"]:
                if 'content' not in output:
                    continue
                for part in output["content"]:
                    if 'text' not in part:
                        continue
                    texts.append(part["text"])
            text = ''.join(texts)
            try:
                code = json.loads(text)["code"]
            except Exception as e:
                print(f"Error parsing code for {idx}: {e}")
                code = scan_code(text)
                print(code)
                FAIL += 1
                #ffw.write(PROMPTS[idx])
                #continue
            fw.write(json.dumps({"index": idx, "response": [code]}))
            fw.write("\n")
            print(f"Processed {i} lines, {FAIL} failed")
