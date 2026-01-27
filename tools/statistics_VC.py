#! /usr/bin/env python3

import numpy as np
from sqlitedict import SqliteDict
import csv
import json

with open("test_set.isabelle.lst", "r") as f:
    test_set_cases = [line.strip() for line in f if line.strip()]

class Statistics:
    def __init__(self):
        self.VC_num = 0
        self.opr_nums = []
        self.oprs = []
        self.expr_sizes = []
        self.quantifier_nums = []
        self.depths = []
        self.symbols = []
        self.all_oprs = set()
        self.cases = []
cat_data = {}
visited = set()

DATA = {}
with SqliteDict(".isabelle.statistics") as db:
    for key, value in db.items():
        DATA[key] = value
with open("meta-data.csv", "w") as f, open("all-meta-data.csv", "w") as ff:
    def sort_key(item):
        key, _ = item
        if not key.startswith("VC$"):
            return (2, key)
        _, target = key.split("$", 1)
        if target.startswith("data/why3/pearl"):
            return (0, target)
        if target.startswith("data/why3/frama-c"):
            return (1, target)
        return (2, target)

    writer = csv.writer(f)
    writer.writerow(["name", "size", "quantifier", "depth", "# of distinct symbol", "dependency graph"])
    writer2 = csv.writer(ff)
    writer2.writerow(["name", "size", "quantifier", "depth", "# of distinct symbol", "dependency graph"])
    for key, value in sorted(DATA.items()):
        if not key.startswith("VC$"):
            continue
        _, target = key.split("$")
        cats, quantifier, atom, depth, non_linear, symbols, total_oprs, dep_thys = value
        dep_thys = {k : v for k, v in dep_thys.items() if not k.startswith("HOL") and not k.startswith("Word_Lib.")\
            and not k.startswith("NTP4Verif.") and not k.startswith("Minilang.") and not k.startswith("Automation_Base.")\
                and k != "Tools.Code_Generator" and not k.startswith("Auto_Sledgehammer.") and not k.startswith("List-Index.")\
                    and not k.startswith("Why3STD.")}
        if isinstance(symbols, int):
            symbol_count = symbols
        else:
            symbol_count = len(symbols)
        writer2.writerow([target, atom, quantifier, depth, symbol_count, json.dumps(dep_thys)])
        if target not in test_set_cases:
            continue
        visited.add(target)
        writer.writerow([target, atom, quantifier, depth, symbol_count, json.dumps(dep_thys)])
        # Merge cats['word'] into cats['int'], create cats['int'] if it does not exist
        if 'word' in cats:
            if 'int' not in cats:
                cats['int'] = {}
            for k, v in cats['word'].items():
                if k in cats['int']:
                    cats['int'][k] += v
                else:
                    cats['int'][k] = v
        if 'int' not in cats:
            print(f"int not in cats: {key[3:]}")
        for cat, opr in cats.items():
            if cat not in cat_data:
                cat_data[cat] = Statistics()
            cat_data[cat].VC_num += 1
            cat_data[cat].opr_nums.append(sum(opr.values()))
            cat_data[cat].oprs.append(opr.keys())
            cat_data[cat].all_oprs.update(opr.keys())
            cat_data[cat].expr_sizes.append(atom)
            cat_data[cat].quantifier_nums.append(quantifier)
            cat_data[cat].depths.append(depth)
            cat_data[cat].symbols.append(symbol_count)
            cat_data[cat].cases.append(key)
        if non_linear:
            print(non_linear)
            cat = "non_linear"
            if cat not in cat_data:
                cat_data[cat] = Statistics()
            cat_data[cat].VC_num += 1
            cat_data[cat].opr_nums.append(sum(non_linear.values()))
            cat_data[cat].oprs.append(non_linear.keys())
            cat_data[cat].all_oprs.update(non_linear.keys())
            cat_data[cat].expr_sizes.append(atom)
            cat_data[cat].quantifier_nums.append(quantifier)
            cat_data[cat].depths.append(depth)
            cat_data[cat].symbols.append(symbol_count)
            cat_data[cat].cases.append(key)
        cat = "all"
        if cat not in cat_data:
            cat_data[cat] = Statistics()
        cat_data[cat].VC_num += 1
        cat_data[cat].opr_nums.append(sum(total_oprs.values()))
        cat_data[cat].oprs.append(total_oprs.keys())
        cat_data[cat].all_oprs.update(total_oprs.keys())
        cat_data[cat].expr_sizes.append(atom)
        cat_data[cat].quantifier_nums.append(quantifier)
        cat_data[cat].depths.append(depth)
        cat_data[cat].symbols.append(symbol_count)
        cat_data[cat].cases.append(key)

for target in test_set_cases:
    if target not in visited:
        print(f"Target {target} not found in cat_data")
    if 'VC$' + target not in cat_data['all'].cases:
        print(f"Target {target} not found in cat_data['all'].cases")

with open("statistics_VC.csv", "w") as f:
    writer = csv.writer(f)
    writer.writerow(["category", "VC_num", "VC_portion", "average oprs", "P75 oprs", "average unique oprs", "P75 unique oprs",\
        "average size", "P75 size", "average depth", "P75 depth", "average quantifier", "P75 quantifier"])
    for cat, data in cat_data.items():
        VC_portion = data.VC_num / len(test_set_cases)
        average_oprs = np.mean(data.opr_nums)
        P75_oprs = np.percentile(data.opr_nums, 75)
        P50_oprs = np.percentile(data.opr_nums, 50)
        P25_oprs = np.percentile(data.opr_nums, 25)
        P75_oprs = f"{P25_oprs} - {P50_oprs} - {P75_oprs}"
        unique_oprs = [len(x) for x in data.oprs]
        average_unique_oprs = np.mean(unique_oprs)
        P75_unique_oprs = np.percentile(unique_oprs, 75)
        P50_unique_oprs = np.percentile(unique_oprs, 50)
        P25_unique_oprs = np.percentile(unique_oprs, 25)
        P75_unique_oprs = f"{P25_unique_oprs} - {P50_unique_oprs} - {P75_unique_oprs}"
        average_size = np.mean(data.expr_sizes)
        P75_size = np.percentile(data.expr_sizes, 75)
        P50_size = np.percentile(data.expr_sizes, 50)
        P25_size = np.percentile(data.expr_sizes, 25)
        P75_size = f"{P25_size} - {P50_size} - {P75_size}"
        average_quantifier = np.mean(data.quantifier_nums)
        P75_quantifier = np.percentile(data.quantifier_nums, 75)
        P50_quantifier = np.percentile(data.quantifier_nums, 50)
        P25_quantifier = np.percentile(data.quantifier_nums, 25)
        P75_quantifier = f"{P25_quantifier} - {P50_quantifier} - {P75_quantifier}"
        average_depth = np.mean(data.depths)
        P75_depth = np.percentile(data.depths, 75)
        P50_depth = np.percentile(data.depths, 50)
        P25_depth = np.percentile(data.depths, 25)
        P75_depth = f"{P25_depth} - {P50_depth} - {P75_depth}"
        writer.writerow([cat, data.VC_num, VC_portion, average_oprs, P75_oprs, average_unique_oprs, P75_unique_oprs, average_size, P75_size, average_depth, P75_depth, average_quantifier, P75_quantifier])
