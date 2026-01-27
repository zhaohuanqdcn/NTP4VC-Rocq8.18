#!/bin/env python3

import os
import sys
import json

def path_of_dep(dep, current_dir, default_session):
    if '.' not in dep and default_session is not None:
        dep = default_session + '.' + dep
    if dep.startswith('mach.') or dep.startswith('Why3STD.'):
        part1, part2 = dep.split('.')
        return os.path.join('./generation/isabelle', part1, part2 + '.thy')
    elif dep == 'NTP4Verif.NTP4Verif':
        return './lib/Isabelle/NTP4Verif/NTP4Verif.thy'
    elif './' in dep:
        return os.path.normpath(os.path.join(current_dir, dep + '.thy'))
    else:
        raise ValueError(f"Unknown dependency: {dep}")

FILES = {}

def read_file(path):
    if path in FILES:
        return FILES[path]
    with open(path, 'r') as f:
        content = f.readlines()
    deps = None
    for line in content:
        line = line.strip()
        if line.startswith('imports '):
            def unquote(s):
                if s.startswith('"') and s.endswith('"'):
                    return s[1:-1]
                return s
            deps = [unquote(s) for s in line[8:].split(' ')]
            break
    if deps is None:
        raise ValueError(f"No imports found in {path}")
    file_name = os.path.basename(path)
    src = f"File `{file_name}`:\n```isabelle\n{''.join(content)}```\n"
    if 'NTP4Verif/NTP4Verif.thy' in path:
        deps = []
    FILES[path] = (deps, src)
    return (deps, src)

def mk_prompt(path, visited, output, session):
    if path in visited:
        return
    visited.add(path)
    (deps, src) = read_file(path)
    for dep in deps:
        if '.' in dep and '/' not in dep:
            next_session, _ = dep.split('.')
        else:
            next_session = session
        mk_prompt(path_of_dep(dep, os.path.dirname(path), session), visited, output, next_session)
    output.append(src)
    return output

def mk_prompt_target(path):
    visited = set()
    output = ["Given the following Isabelle theories as context, prove the Isabelle proposition given at the end.\n"]
    visited.add(path)
    (deps, _) = read_file(path)
    for dep in deps:
        if '.' in dep and '/' not in dep:
            next_session, _ = dep.split('.')
        else:
            next_session = None
        mk_prompt(path_of_dep(dep, os.path.dirname(path), None), visited, output, next_session)
    with open(path, 'r') as f:
        lines = f.readlines()
    last_out = ["Given the context above, consider the proposition in the following Isabelle code:\n```isabelle\n"]
    for line in lines:
        if line.strip() == 'sorry' and last_out:
            goal = last_out.pop()
            last_out.append("\n(*Prove the following Isabelle proposition:*)\n")
            last_out.append(goal)
            last_out.append("(*Generate the proof here*)\n")
        else:
            last_out.append(line)
    last_out.append("```\nResponse the Isabelle proof only. Do not repeate any context nor the statement.")
    output.append(''.join(last_out))
    return '\n'.join(output)

with open('general-prompt.isabelle.jsonl', 'w') as fw:
    with open('test_set.isabelle.lst', 'r') as f:
        files = [line.strip() for line in f.readlines()]
        for file in files:
            prm = mk_prompt_target(file)
            fw.write(json.dumps({
                "index": file,
                "request": prm,
            }))
            fw.write("\n")
# 
# prm = mk_prompt_target('data/why3/pearl/mex_vcg/isabelle/mex_MexArrayInPlace_mexqtvc.thy')
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
# 
# sys.exit(0)
# 
# 
# def traverse_thy_files(root_dir):
#     queue = [root_dir]
#     thy_files = []
#     while queue:
#         current_dir = queue.pop(0)
#         try:
#             entries = sorted(os.listdir(current_dir))
#         except Exception:
#             continue
#         dirs = []
#         files = []
#         for entry in entries:
#             full_path = os.path.join(current_dir, entry)
#             if os.path.isdir(full_path):
#                 dirs.append(full_path)
#             elif os.path.isfile(full_path) and entry.endswith('.thy'):
#                 files.append(full_path)
#         # Add .thy files in this directory (pre-order: before subdirs)
#         thy_files.extend(files)
#         # Add subdirectories to queue for breadth-first traversal
#         queue.extend(dirs)
#     return thy_files
# 
# prompt_dep('./lib/Isabelle/NTP4Verif/NTP4Verif.thy')
# 
# for f in traverse_thy_files('./generation/isabelle'):
#     prompt_dep(f)
# 
# PRELUDES = [
#     "Given the following Isabelle theories as context, prove the Isabelle proposition given at the end.\n"]
# 
# PRELUDE = '\n'.join(PRELUDES)
# 
# 
# LIBS = {}
# 
# def prompt_lib(path):
#     base_dir = os.path.dirname(os.path.dirname(os.path.dirname(path)))
#     lib_dir = os.path.join(base_dir, 'lib', 'isabelle')
#     if os.path.exists(lib_dir):
#         if lib_dir in LIBS:
#             return LIBS[lib_dir]
#         else:
#             thy_files = traverse_thy_files(lib_dir)
#             prompts = []
#             for f in thy_files:
#                 prompts.append(prompt_dep(f))
#             LIBS[lib_dir] = '\n'.join(prompts)
#             return LIBS[lib_dir]
#     else:
#         lib_dir = os.path.dirname(path)
#         if lib_dir in LIBS:
#             return LIBS[lib_dir]
#         else:
#             thy_files = traverse_thy_files(lib_dir)
#             prompts = []
#             for f in thy_files:
#                 if not f.endswith('qtvc.thy'):
#                     prompts.append(prompt_dep(f))
#             LIBS[lib_dir] = '\n'.join(prompts)
#             return LIBS[lib_dir]
# 
# def prompt_thy(path):
#     with open(path, 'r') as f:
#         content = f.read()
#     content = content.replace('sorry', "(* fill in a proof here. *)")
#     prompts = [PRELUDE, prompt_lib(path), "Prove the following Isabelle proposition:\n```isabelle\n", content, "```\nResponse the Isabelle proof only. Do not repeate any context nor the proposition."]
#     return '\n'.join(prompts)
# 
# 
# with open('test_set.isabelle.lst', 'r') as f:
#     isabelle_files = [line.strip() for line in f.readlines()]
# 
# with open("batch_isabelle.jsonl", "w") as f:
#     for i, file_path in enumerate(isabelle_files):
#         print(f"[{i}/{len(isabelle_files)}] Processing {file_path}")
#         prompt = prompt_thy(file_path)
#         f.write(json.dumps({
#             "key": file_path,
#             "request": {
#                 "contents": [{"parts": [{"text": prompt}]}]},
#             "generationConfig": {
#                 'responseMimeType': 'application/json',
#                 "responseSchema": {
#                     "type":"OBJECT",
#                     "properties":{"code":{"type":"STRING"}},
#                     "required":["code"]
#                 },
#                 #'temperature': 0
#             }
#         }))
#         f.write("\n")
# 