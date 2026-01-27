#!/bin/env python3
import json

with open('test_set.lean.lst', 'r') as f:
    def map(path):
        return path.strip().replace('lean_standalone/', 'lean/')
    files = [map(line) for line in f.readlines()]

def prompt(file):
    with open(file, 'r') as f:
        content = f.read()
    prompts = [ "Given the following Lean4 code, prove the Lean4 proposition given at the end.\n```lean\n" ]
    lines = content.splitlines(keepends=True)
    for line in lines:
        if line.strip() == ':= sorry':
            last = prompts.pop()
            prompts.append("\n-- Prove the following proposition:\n")
            prompts.append(last)
            prompts.append(":=\n-- Generate the proof here\n")
        else:
            prompts.append(line)
    prompts.append("```\nResponse the proof only. Do not repeate any context nor the statement.")
    return ''.join(prompts)

def prompt_dpsk(file):
    with open(file, 'r') as f:
        content = f.read()
    prompts = [ "Complete the following Lean 4 code:\n\n```lean\n" ]
    lines = content.splitlines(keepends=True)
    for line in lines:
        if line.strip() == ':= sorry':
            last = prompts.pop()
            prompts.append("\n-- Prove the following proposition:\n")
            prompts.append(last)
            prompts.append(":=\n-- Generate the proof here\n")
        else:
            prompts.append(line)
    prompts.append("```\n\n"
"Before producing the Lean 4 code to formally prove the given theorem, provide a detailed proof plan outlining the main proof steps and strategies.\n"
"The plan should highlight key ideas, intermediate lemmas, and proof structures that will guide the construction of the final formal proof.\n"
"Response the proof plan only. Do not repeate any context nor the statement.")
    return ''.join(prompts)


with open('general-prompt.lean.jsonl', 'w') as fw:
    with open('test_set.lean.lst', 'r') as f:
        files = [line.strip() for line in f.readlines()]
        for file in files:
            file = file.replace('/lean/', '/lean_standalone/')
            prm = prompt(file)
            fw.write(json.dumps({
                "index": file,
                "request": prm,
            }))
            fw.write("\n")


with open('general-prompt-dpsk.lean.jsonl', 'w') as fw:
    with open('test_set.lean.lst', 'r') as f:
        files = [line.strip() for line in f.readlines()]
        for file in files:
            file = file.replace('/lean/', '/lean_standalone/')
            prm = prompt_dpsk(file)
            fw.write(json.dumps({
                "index": file,
                "request": prm,
            }))
            fw.write("\n")

# prm = prompt('data/why3/pearl/add_list_vcg/lean/add_list_AddListImp_sumqtvc.lean')
# print(prm)
# 
# from google import genai
# 
# client = genai.Client()
# response = client.models.generate_content(
#     model="gemini-2.5-flash-lite",
#     contents=prm,
#     config={
#         'response_mime_type': 'application/json',
#         'response_schema': {
#             "type":"OBJECT",
#             "properties":{"code":{"type":"STRING"}},
#             "required":["code"]
#         },    },
# )
# # Use the response as a JSON string.
# print(response.parsed['code'])
# print(response.text)
# 
# 
# # with open('lean.general-prompt.jsonl', 'w') as f:
# #     for file in files:
# #         f.write(json.dumps({
# #             "prompt": content,
# #             "completion": ""
# #         }) + "\n")
# 
# 
# 