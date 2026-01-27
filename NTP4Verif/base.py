from enum import Enum
import math
import yaml
import os
import xml.etree.ElementTree as ET 
import logging
import subprocess
import re

EXEMPLIFY_IMPORT = {
    'int.Int', 'int.MinMax', 'why3.HighOrd.HighOrd', 'why3.Bool.Bool', 'why3.Unit.Unit', 'why3.Tuple0.Tuple0',
    'why3.Tuple2.Tuple2', 'why3.Tuple1.Tuple1', 'int.ComputerDivision', 'int.EuclideanDivision',
    'ref.Ref', 'array.Array', 'int.Power', 'map.Map', 'why3.list.List', 'real.Real', 'real.RealInfix',
    'map.Occ', 'list.Reverse', 'list.Nth', 'list.Mem', 'list.ListRich', 'list.List', 'list.Length',
    'list.Append', 'list.NthHdTl', 'list.RevAppend', 'seq.Seq', 'seq.Mem', 'list.NthLength',
    'list.HdTl', 'mach.peano.Peano',
    'mach.peano.Int16', 'mach.int.Int16',
    'mach.peano.Int31', 'mach.int.Int31',
    'mach.peano.Int32', 'mach.int.Int32',
    'mach.peano.Int63', 'mach.int.Int63',
    'mach.peano.Int64', 'mach.int.Int64',
    'mach.peano.UInt16', 'mach.int.UInt16',
    'mach.peano.UInt31', 'mach.int.UInt31',
    'mach.peano.UInt32', 'mach.int.UInt32',
    'mach.peano.UInt63', 'mach.int.UInt63',
    'mach.peano.UInt64', 'mach.int.UInt64',
    'mach.int.Int', 'mach.int.Int32GMP', 'mach.int.Refint63',
    'mach.int.UInt32GMP', 'mach.int.UInt32Gen',
    'mach.int.UInt64GMP', 'mach.int.UInt64Gen',
    'list.Distinct', 'why3.list.Distinct',
    'list.NthNoOpt', 'why3.list.NthNoOpt',
    'set.Fset', 'why3.set.Fset', 'int.Abs',
    'mach.array.Array31', 'mach.array.Array32', 'mach.array.Array63', 'mach.array.Array64',
    'bv.BV8', 'bv.BV16', 'bv.BV32', 'bv.BV64', 'bv.BV128', 'bv.BV256',
    'bool.Bool', 'number.Parity', 'bv.Pow2int', 'mach.int.Byte',
    'bag.Bag', 'number.Divisibility', 'number.Prime', 'number.Gcd', 'number.Coprime',
    'seq.FreeMonoid', 'list.SortedInt', 'string.String', 'string.Char', 'option.Option',
    'set.Set', 'fmap.Fmap', 'seq.Reverse', 'fmap.MapImpInt',

    'array.ToList', 'array.ToSeq', 'seq.ToList', 'seq.OfList', 'seq.Distinct', 'set.FsetInt', 'array.ArrayEq', 'array.ArrayExchange',
    'array.ArrayPermut', 'array.ArraySwap', 'array.Init', 'seq.Exchange', 'array.ArraySum', 'seq.Sum', 'ref.Refint',
    'set.SetAppInt', 'array.NumOfEq', 'string.OCaml', 'real.Square', 'real.Abs', 'real.ExpLog', 'real.PowerReal',
    'real.FromInt', 'real.MinMax', 'list.Combine', 'list.Elements', 'list.FoldRight', 'list.HdTlNoOpt',
    'list.NthLengthAppend', 'list.NumOcc', 'list.Permut', 'list.Quant', 'seq.Occ', 'seq.Permut', 'seq.SeqEq',
    'seq.SortedInt', 'bv.BVConverter_8_32', 'bv.BVConverter_8_128', 'bv.BVConverter_32_64', 'bv.BVConverter_32_128',
    'bv.BVConverter_64_128', 'real.Trigonometry', 'list.Sum', 'mach.int.Int32BV'
}

NO_LOAD_DIR = {
    'data/why3/examples',
    'data/why3/no-lemma5'
}

ADDITIONAL_LOADING_PATHS = []

# Simple logger setup with colors
try:
    import colorlog
    # Use colorlog if available
    handler = colorlog.StreamHandler()
    handler.setFormatter(colorlog.ColoredFormatter(
        '%(asctime)s - %(log_color)s%(levelname)s%(reset)s: %(message)s',
        datefmt='%m-%d %H:%M:%S'
    ))
    logging.basicConfig(
        level=logging.INFO,
        handlers=[handler]
    )
except ImportError:
    # Fallback to standard logging without colors
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s: %(message)s',
        datefmt='%m-%d %H:%M:%S',
        handlers=[logging.StreamHandler()]
    )

logger = logging.getLogger('NTP4Verif')


def alpnum_name(name):
    return str(name).translate(str.maketrans({
        ' ': "_", '#': "sh",
        '`': "bq", '~': "tl", '!': "ex",
        '@': "at", '$': "dl", '%': "pc",
        '^': "cf", '&': "et", '*': "as",
        '(': "lp", ')': "rp", '-': "mn",
        '+': "pl", '=': "eq", '[': "lb",
        ']': "rb", '{': "lc", '}': "rc",
        ':': "cl", '\'': "qt", '"': "dq",
        '<': "ls", '>': "gt", '/': "sl",
        '?': "qu", '\\': "bs", '|': "br",
        ';': "sc", ',': "cm", '.': "dt", '\n': "nl"
    }))

class TY(Enum):
    FUN = 1
    TYPE = 2
    VAR = 3
    PRODT = 4

class TM(Enum):
    APP = 1
    CONST = 2
    VAR = 3
    CASE = 4
    NUM = 5
    ABS = 6
    PROD = 7
    AS = 8
    STRING = 9

def quote(s):
    if all(c.isalnum() or c == '_' or c == "'" for c in s):
        return s
    return f'"{s}"'

def head_of (a) -> str:
    match a:
        case (TM.APP, [h, _]):
            return head_of(h)
        case (TM.VAR, name, _):
            return name
        case _:
            raise ValueError(f"gen_def - head_of: {a}")

def head_of_eq(eq):
    match eq:
        case (TM.APP, [(TM.CONST, '$eq', _), a, b]):
            return head_of(a)
        case (TM.APP, [(TM.CONST, 'HOL.eq', _), a, b]):
            return head_of(a)
        case _:
            raise ValueError(f"head_of_eq: {eq}")

def has_term(P, tm):
    if P(tm):
        return True
    match tm:
        case (TM.APP, tms):
            for tm in tms:
                if has_term(P, tm):
                    return True
            return False
        case (TM.ABS, _, _, body):
            if P(body):
                return True
            else:
                return has_term(P, body)
        case (TM.PROD, tms):
            for tm in tms:
                if has_term(P, tm):
                    return True
            return False
        case (TM.CASE, tm, pats):
            if has_term(P, tm):
                return True
            else:
                for (_, _, r) in pats:
                    if has_term(P, r):
                        return True
        case (TM.AS, _, tm):
            return has_term(P, tm)
        case _:
            return False

def fix_lhs_dummy(eq, safe=False):
    vars = collect_vars(eq)
    def fix_dummy(tm):
        match tm:
            case (TM.CONST, "Pure.dummy_pattern", ty) | (TM.VAR, '_', ty):
                name = variant_var(vars, "x")
                vars[name] = ty
                return (TM.VAR, name, ty)
            case (TM.APP, tms):
                return (TM.APP, [fix_dummy(tm) for tm in tms])
            case (TM.PROD, tms):
                return (TM.PROD, [fix_dummy(tm) for tm in tms])
            case X:
                return X
    match eq:
        case (TM.APP, [(TM.CONST, '$eq', ty), a, b]):
            return (TM.APP, [(TM.CONST, '$eq', ty), fix_dummy(a), fix_dummy(b)])
        case (TM.APP, [(TM.CONST, 'HOL.eq', ty), a, b]):
            return (TM.APP, [(TM.CONST, 'HOL.eq', ty), fix_dummy(a), fix_dummy(b)])
        case _:
            if safe:
                return eq
            else:
                raise ValueError(f"fix_lhs_dummy: {eq}")

def fold_sexpr(F, sexpr):
    def app(sexpr):
        F(sexpr)
        match sexpr:
            case (TM.APP, tms):
                for tm in tms:
                    app(tm)
            case (TM.ABS, _, _, body):
                app(body)
            case (TM.PROD, tms):
                for tm in tms:
                    app(tm)
            case (TM.CASE, tm, pats):
                app(tm)
                for (_, _, r) in pats:
                    app(r)
            case (TM.AS, _, tm):
                app(tm)
    return app(sexpr)

def fold_typ(typ, F):
    def app(typ):
        F(typ)
        match typ:
            case (TY.FUN, tms):
                for tm in tms:
                    app(tm)
            case (TY.TYPE, _, _, tms):
                for tm in tms:
                    app(tm)
            case (TY.VAR, name):
                F(name)
            case (TY.PRODT, tms):
                for tm in tms:
                    app(tm)
            case _:
                raise ValueError(f"fold_typ: {typ}")
    return app(typ)

def collect_tvars(typ, ret = None):
    if ret is None:
        ret = set()
    def fold(typ):
        match typ:
            case (TY.VAR, name):
                ret.add(name)
    fold_typ(typ, fold)
    return ret

def has_tvar(typ):
    ret = False
    def fold(typ):
        nonlocal ret
        match typ:
            case (TY.VAR, name):
                ret = True
    fold_typ(typ, fold)
    return ret

def collect_tm_tvars(sexpr, ret = None):
    if ret is None:
        ret = set()
    def F(sexpr):
        match sexpr:
            case (TM.APP, tms):
                for tm in tms:
                    F(tm)
            case (TM.CONST, _, ty):
                if ty is not None:
                    collect_tvars(ty, ret)
            case (TM.VAR, _, ty):
                if ty is not None:
                    collect_tvars(ty, ret)
            case (TM.ABS, _, ty, body):
                if ty is not None:
                    collect_tvars(ty, ret)
                F(body)
            case (TM.PROD, tms):
                for tm in tms:
                    F(tm)
            case (TM.CASE, tm, pats):
                F(tm)
                for (pat, ty, r) in pats:
                    if ty is not None:
                        collect_tvars(ty, ret)
                    F(pat)
                    F(r)
            case (TM.AS, ty, tm):
                F(tm)
            case (TM.PROD, tms):
                for tm in tms:
                    F(tm)
            case (TM.NUM, _, ty):
                if ty is not None:
                    collect_tvars(ty, ret)
            case (TM.STRING, _):
                pass
            case _:
                raise ValueError(f"collect_tm_tvars: {sexpr}")
    fold_sexpr(F, sexpr)
    return ret

def collect_consts(sexpr, ret = None):
    if ret is None:
        ret = {}
    def F(sexpr):
        match sexpr:
            case (TM.CONST, name, ty):
                ret[name] = ty
    fold_sexpr(F, sexpr)
    return ret

def collect_free_bound_vars(sexpr, ret = None):
    if ret is None:
        ret = {}
    def F(sexpr):
        match sexpr:
            case (TM.VAR, name, ty):
                ret[name] = ty
    fold_sexpr(F, sexpr)
    return ret

def collect_vars(sexpr, ret=None):
    if ret is None:
        ret = {}
    def save(names):
        def get(name):
            if name in ret:
                return ret[name]
            else:
                return None
        return {name: get(name) for name in names}
    def restore(values):
        for (name, value) in values.items():
            if value is None:
                if name in ret:
                    del ret[name]
            else:
                ret[name] = value
    def app(sexpr):
        match sexpr:
            case (TM.APP, tms):
                for tm in tms:
                    app(tm)
            case (TM.VAR, name, ty):
                if name in ret:
                    if ty is not None and ret[name] is not None and ret[name] != ty:
                        raise ValueError(f"type of variable {name} mismatch: {sexpr}")
                else:
                    ret[name] = ty
            case (TM.ABS, name, ty, body):
                originals = save([name])
                ret[name] = ty
                app(body)
                restore(originals)
            case (TM.PROD, tms):
                for tm in tms:
                    app(tm)
            case (TM.CASE, tm, pats):
                app(tm)
                for (pat, _, r) in pats:
                    pvs = {}
                    collect_vars(pat, pvs)
                    originals = save(pvs.keys())
                    app(r)
                    restore(originals)
            case (TM.AS, name, tm):
                app(tm)
                originals = save([name])
                app(tm)
                restore(originals)
            case (TM.NUM, _, _):
                pass
            case (TM.STRING, _):
                pass
            case (TM.CONST, _, _):
                pass
            case _:
                raise ValueError(f"collect_vars: {sexpr}")
    if isinstance(sexpr, list):
        for tm in sexpr:
            app(tm)
    else:
        app(sexpr)
    return ret

def variant_var(vars : dict[str, 'type'], name : str):
    if name in vars:
        i = 0
        while name + str(i) in vars:
            i += 1
        return name + str(i)
    else:
        return name
    
def subst_free_bound(subst, term):
    if not subst:
        return term
    def app(term):
        match term:
            case (TM.VAR, name, ty):
                if name in subst:
                    name = subst[name]
                    return (TM.VAR, name, ty)
                else:
                    return term
            case (TM.APP, tms):
                return (TM.APP, [app(tm) for tm in tms])
            case (TM.ABS, name, ty, body):
                if name in subst:
                    name = subst[name]
                return (TM.ABS, name, ty, app(body))
            case (TM.PROD, tms):
                return (TM.PROD, [app(tm) for tm in tms])
            case (TM.CASE, tm, pats):
                return (TM.CASE, app(tm), [(app(p), ty, app(r)) for (p, ty, r) in pats])
            case (TM.AS, name, tm):
                if name in subst:
                    name = subst[name]
                return (TM.AS, name, app(tm))
            case _:
                return term
    return app(term)

def subst_var(subst, term):
    # subst : (name : str) -> term
    def save(names):
        backup = {}
        for name in names:
            if name in subst:
                backup[name] = subst[name]
                if name in subst:
                    del subst[name]
        return backup
    def restore(backup):
        for (name, value) in backup.items():
            subst[name] = value
    def app(term):
        match term:
            case (TM.VAR, name, ty):
                if name in subst:
                    return subst[name]
                else:
                    return term
            case (TM.APP, tms):
                return (TM.APP, [app(tm) for tm in tms])
            case (TM.ABS, name, ty, body):
                b = save([name])
                ret = (TM.ABS, name, ty, app(body))
                restore(b)
                return ret
            case (TM.PROD, tms):
                return (TM.PROD, [app(tm) for tm in tms])
            case (TM.CASE, tm, pats):
                ret_pats = []
                for (p, ty, r) in pats:
                    pvs = collect_vars(p)
                    b = save(pvs.keys())
                    ret_pats.append((p, ty, app(r)))
                    restore(b)
                return (TM.CASE, app(tm), ret_pats)
            case (TM.AS, name, tm):
                b = save([name])
                ret = (TM.AS, name, app(tm))
                restore(b)
                return ret
            case (TM.NUM, _, _):
                return term
            case (TM.STRING, _):
                return term
            case (TM.CONST, _, _):
                return term
            case _:
                raise ValueError(f"subst_var: {term}")
    return app(term)

def deconflict_var_consts(sexpr):
    consts = collect_consts(sexpr)
    def short_name(k):
        if '.' in k:
            return k.split('.')[-1]
        else:
            return k
    consts = {short_name(k): v for k, v in consts.items()}
    has_conflict = False
    vars = collect_vars(sexpr)
    for name in vars:
        if name in consts:
            has_conflict = True
            break
    if not has_conflict:
        print(consts.keys())
        return sexpr
    subst = {}
    for name in list(vars.keys()):
        if name in consts:
            name2 = variant_var(consts, name)
            subst[name] = name2
            vars[name2] = True
    return subst_free_bound(subst, sexpr)

def default_variant_bad_name(name):
    name = name.replace('_', '')
    if name == '':
        return 'x'
    return name

def variant_bad_vars(P, tms, variant=default_variant_bad_name):
    def is_bad_var(tm):
        match tm:
            case (TM.VAR, name, _):
                return P(name)
        return False
    if any(has_term(is_bad_var, tm) for tm in tms):
        vars = collect_vars(tms)
        subst = {}
        for v, ty in list(vars.items()):
            if P(v):
                name = variant_var(vars, variant(v))
                vars[name] = ty
                subst[v] = (TM.VAR, name, ty)
        if not subst:
            return tms
        return [subst_var(subst, tm) for tm in tms]
    else:
        return tms

def subst_dummy(tm):
    def is_dummy(tm):
        match tm:
            case (TM.VAR, '_', _):
                return True
            case (TM.CONST, 'Pure.dummy_pattern', _):
                return True
            case _:
                return False
    if has_term(is_dummy, tm):
        vars = collect_vars(tm)
        def assign(ty):
            name = variant_var(vars, 'x')
            vars[name] = ty
            return (TM.VAR, name, ty)
        def subst(tm):
            match tm:
                case (TM.VAR, '_', ty):
                    return assign(ty)
                case (TM.CONST, 'Pure.dummy_pattern', ty):
                    return assign(ty)
                case (TM.APP, tms):
                    return (TM.APP, [subst(tm) for tm in tms])
                case (TM.PROD, tms):
                    return (TM.PROD, [subst(tm) for tm in tms])
                case (TM.CASE, tm, pats):
                    return (TM.CASE, subst(tm), [(p, ty, subst(r)) for (p, ty, r) in pats])
                case (TM.AS, name, tm):
                    return (TM.AS, name, subst(tm))
                case (TM.ABS, name, ty, body):
                    vars[name] = ty
                    return (TM.ABS, name, ty, subst(body))
                case _:
                    return tm
        return subst(tm)
    else:
        return tm

def load_rewrite_rule(rhs):
    def mk_term(yml):
        match yml:
            case int():
                return yml
            case str():
                if re.fullmatch(r'\d+(%.*)?', yml):
                    return (TM.NUM, yml, None)
                try:
                    int(yml)
                    return (TM.NUM, yml, None)
                except ValueError:
                    return (TM.CONST, yml, None)
            case list():
                return (TM.APP, [mk_term(x) for x in yml])
            case _:
                raise ValueError(f"load_rewrite_rule: {yml}")
    return mk_term(rhs)


def rewrite(rules, tm):
    def app(tm):
        match tm:
            case (TM.APP, [(TM.CONST, name, _), *args]) if len(args) > 0 and (name, len(args)) in rules:
                rhs = rules[(name, len(args))]
                def inst(xx):
                    match xx:
                        case int():
                            return args[xx]
                        case (TM.APP, tms):
                            return (TM.APP, [inst(tm) for tm in tms])
                        case (TM.CASE, tm, pats):
                            return (TM.CASE, inst(tm), [(inst(p), ty, inst(r)) for (p, ty, r) in pats])
                        case (TM.ABS, name, ty, body):
                            return (TM.ABS, name, ty, inst(body))
                        case (TM.PROD, tms):
                            return (TM.PROD, [inst(tm) for tm in tms])
                        case (TM.AS, name, tm):
                            return (TM.AS, name, inst(tm))
                        case _:
                            return xx
                return app(inst(rhs))
            case (TM.APP, [(TM.CONST, name, ty), *args]) if (name, 0) in rules:
                match rules[(name, 0)]:
                    case (TM.CONST, name2, _):
                        return app((TM.APP, [(TM.CONST, name2, ty), *args]))
                    case _:
                        return app((TM.APP, [rules[(name, 0)], *args]))
            case (TM.CONST, name, ty) if (name, 0) in rules:
                match rules[(name, 0)]:
                    case (TM.CONST, name2, _):
                        return (TM.CONST, name2, ty)
                    case _:
                        return rules[(name, 0)]
            case (TM.APP, tms):
                return (TM.APP, [app(tm) for tm in tms])
            case (TM.PROD, tms):
                return (TM.PROD, [app(tm) for tm in tms])
            case (TM.CASE, tm, pats):
                return (TM.CASE, app(tm), [(app(p), ty, app(r)) for (p, ty, r) in pats])
            case (TM.AS, name, tm):
                return (TM.AS, name, app(tm))
            case (TM.ABS, name, ty, body):
                return (TM.ABS, name, ty, app(body))
            case _:
                return tm
    return app(tm)

def unfold_let(tm):
    match tm:
        case (TM.APP, [(TM.CONST, 'HOL.Let', _), v, (TM.ABS, x, t, body)]):
            return unfold_let(subst_var({x: v}, body))
        case _:
            return tm

PRINTERS = {}

def parse_LHS (a):
    match a:
        case (TM.APP, [h, *args]):
            args2 = []
            for x in args:
                match x:
                    case (TM.VAR, name, ty):
                        args2.append((name, ty))
                    case _:
                        raise ValueError(f"gen_def - parse_LHS: {x}")
            return (h, args2)
        case _:
            return (a, [])

def parse_EQ(eq):
    match eq:
        case (TM.APP, [(TM.CONST, '$eq', _), a, RHS]):
            return (parse_LHS(a), RHS)
        case (TM.APP, [(TM.CONST, 'HOL.eq', _), a, RHS]):
            return (parse_LHS(a), RHS)
        case _:
            raise ValueError(f"head_of_eq: {eq}")

def pattern_as_to_let(p, r, bad_varnames=None, use_let=True, vs=None):
    ass = []
    vs = collect_vars(p, vs)
    rename = {}
    def pass_pat(p, lv):
        match p:
            case (TM.AS, name, tm):
                tm2 = pass_pat(tm, lv+1)
                ass.append((name, tm2))
                return tm2
            case (TM.APP, tms):
                tms2 = [pass_pat(tm, lv) for tm in tms]
                return (TM.APP, tms2)
            case (TM.CONST, 'Pure.dummy_pattern', ty) if lv > 0:
                vname = variant_var(vs, 'x')
                vs[vname] = ty
                return (TM.VAR, vname, ty)
            case (TM.ABS, name, ty, body):
                if name in vs:
                    old = vs[name]
                else:
                    old = None
                vs[name] = ty
                body2 = pass_pat(body, lv)
                if old is None:
                    del vs[name]
                else:
                    vs[name] = old
                return (TM.ABS, name, ty, body2)
            case (TM.PROD, tms):
                tms2 = [pass_pat(tm, lv) for tm in tms]
                return (TM.PROD, tms2)
            case (TM.VAR, name, ty):
                if bad_varnames is not None and name in bad_varnames:
                    name2 = name
                    while name2 in bad_varnames:
                        name2 = name2 + "'"
                    v = (TM.VAR, name2, ty)
                    rename[name] = v 
                    return v
                return p
            case _:
                return p
    p = pass_pat(p, 0)
    if rename:
        r = subst_var(rename, r)
    if use_let:
        for (name, ttm) in ass:
            r = (TM.APP, [(TM.CONST, 'HOL.Let', None), ttm, (TM.ABS, name, None, r)])
    else:
        subst = {k: ttm for k, ttm in ass}
        r = subst_var(subst, r)
    return (p, r)

def size_of_term(tm):
    operators = 0
    def visit(x):
        nonlocal operators
        operators += 1
    fold_sexpr(visit, tm)
    return operators

def quantifier_alternation(tm):
    def app(last_quant, alter, sexpr):
        match sexpr:
            case (TM.APP, [(TM.CONST, quant, _, _), tm]) if quant in ['HOL.All', 'HOL.Ex']:
                if last_quant != quant:
                    alter += 1
                return app(quant, alter, tm)
            case (TM.APP, tms):
                if tms:
                    return max(app(last_quant, alter, tm) for tm in tms)
                else:
                    return alter
            case (TM.ABS, _, _, body):
                return app(last_quant, alter, body)
            case (TM.PROD, tms):
                if tms:
                    return max(app(last_quant, alter, tm) for tm in tms)
                else:
                    return alter
            case (TM.CASE, tm, pats):
                values = [app(last_quant, alter, tm)]
                if pats:
                    values.extend([app(last_quant, alter, pat_tm) for pat_tm in pats])
                return max(values)
            case (TM.AS, _, tm):
                return app(last_quant, alter, tm)
            case _:
                return alter
    return app(None, 0, tm)

def depth_of_term(tm):
    def app(depth, sexpr):
        depth += 1
        match sexpr:
            case (TM.APP, tms):
                if tms:
                    return max(app(depth, tm) for tm in tms)
                else:
                    return depth
            case (TM.ABS, _, _, body):
                return app(depth, body)
            case (TM.PROD, tms):
                if tms:
                    return max(app(depth, tm) for tm in tms)
                else:
                    return depth
            case (TM.CASE, tm, pats):
                values = [app(depth, tm)]
                if pats:
                    values.extend([app(depth, pat_tm) for pat_tm in pats])
                return max(values)
            case (TM.AS, _, tm):
                return app(depth, tm)
            case _:
                return depth
    return app(0, tm)

def unique_symbols_of(tm, symbls=None):
    if symbls is None:
        symbls = set()
    def meet_typ(ty):
        match ty:
            case (TY.TYPE, name, _, _):
                symbls.add(name)
    def meet(x):
        match x:
            case (TM.CONST, name, ty):
                symbls.add(name)
                if ty is not None:
                    fold_typ(ty, meet_typ)
            case (TM.VAR, name, ty):
                symbls.add(name)
                if ty is not None:
                    fold_typ(ty, meet_typ)
            case (TM.NUM, literal, ty):
                symbls.add(literal)
                if ty is not None:
                    fold_typ(ty, meet_typ)
            case (TM.ABS, name, ty, _):
                symbls.add(name)
                if ty is not None:
                    fold_typ(ty, meet_typ)
            case (TM.AS, name, _):
                symbls.add(name)
            case (TM.STRING, literal):
                symbls.add('"' + literal + '"')
    fold_sexpr(meet, tm)
    return symbls

def number_of_quantifiers(tm):
    number = 0
    def visit(tm):
        nonlocal number
        match tm:
            case (TM.APP, [(TM.CONST, quant, _, _), _]):
                if quant in ['HOL.All', 'HOL.Ex']:
                    number += 1
    fold_sexpr(visit, tm)
    return number

def constant_dependencies_of(tm, deps=None):
    if deps is None:
        deps = set()
    def visit(tm):
        match tm:
            case (TM.CONST, name, _):
                deps.add(name)
    fold_sexpr(visit, tm)
    return deps

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

class Exporter:
    def __init__(self, file, language, working_module, working_mlw_file, type_as_term=False, statistics=None):
        self.file = file
        self.working_module = working_module
        self.working_mlw_file = working_mlw_file
        if self.working_mlw_file is not None:
            self.working_mlw_file_rel = os.path.relpath(os.path.abspath(self.working_mlw_file), BASE_DIR)
        else:
            self.working_mlw_file_rel = None
        self.language = language
        self.statistics = statistics
        self.axioms = {}
        self.defs = {}
        self.datatypes = {}
        self.binops = {}
        self.prefix_ops = {}
        self._atoms = {}
        if type_as_term:
            self.types = self._atoms
        else:
            self.types = {}
        self.local_atom_mapping = {}
        self.local_type_mapping = {}
        self.binders = {}
        self.rewrites = {}
        self.local_axioms = {}
        self.local_defs = {}
        self.local_datatypes = {}
        self.local_binops = {}
        self.local_atoms = {}
        self.local_atom_short_names = {}
        self.local_types = {}
        self.local_prefix_ops = {}
        self.loaded_short_atoms = {}
        if type_as_term:
            self.loaded_short_types = self.loaded_short_atoms
        else:
            self.loaded_short_types = {}
        self.local_binders = {}

        if self.working_mlw_file is not None:
            base_dir = os.path.abspath('./data/why3')
            rel_path = os.path.splitext(os.path.relpath(os.path.abspath(self.working_mlw_file), base_dir))[0]
            self.qualifiers = rel_path.split('/')[1:]
        else:
            self.qualifiers = None

        #self.contextual_vars = {}
        self.free_bound_contextual_vars = set()
    
    def qualify(self, name):
        if self.working_module:
            return self.working_module + '.' + name
        else:
            return name
    
    def pretty_qualify(self, name):
        if self.working_module:
            if self.working_module == 'VCG_endpoint':
                return os.path.splitext(os.path.basename(self.working_mlw_file))[0] + '.' + name
            else:
                return self.working_module + '.' + name
        else:
            return name

    def decl_type(self, why3name, xname):
        if self.working_module is None:
            return
        if '.' not in why3name:
            why3name = self.working_module + '.' + why3name
        self._decl_type_(why3name, xname)
        self.local_types[why3name] = xname

    def decl_axiom(self, why3name, xname):
        if self.working_module is None:
            return
        if '.' not in why3name:
            why3name = self.working_module + '.' + why3name
        self.local_axioms[why3name] = xname
        self.axioms[why3name] = xname
    
    def decl_atom(self, why3name, xname):
        if self.working_module is None:
            return
        self.local_atom_short_names[why3name] = xname
        if '.' not in why3name:
            why3name = self.working_module + '.' + why3name
        self._decl_atom_(why3name, xname)
        self.local_atoms[why3name] = xname

    def name_translation(self, name):
        ret = alpnum_name(name)
        if ret.startswith('infix'):
            ret = ret.replace('.', 'dot')
        return ret

    def name_of (self, element) -> str:
        name = element.attrib['name']
        name = self.name_translation(name)
        if 'path' in element.attrib:
            path = element.attrib['path']
            if self.working_module is not None and self.working_module == path:
                return name
            else:
                return path + '.' + name
        else:
            return name

    def altname_of (self, element) -> str:
        if 'path' in element.attrib:
            path = element.attrib['path']
            if self.working_module is not None and self.working_module == path:
                return element.attrib['altname']
            else:
                return path + '.' + element.attrib['altname']
        else:
            return element.attrib['altname']

    def sexpr_type(self, typ):
        match typ.tag:
            case 'fun':
                return (TY.FUN, [self.sexpr_type(t) for t in typ])
            case 'type':
                if 'local' in typ.attrib:
                    local = typ.attrib['local']
                else:
                    local = None
                name = self.name_of(typ)
                match name:
                    case 'why3.HighOrd.HighOrd.infix_mngt':
                        return (TY.FUN, [self.sexpr_type(t) for t in typ])
                    case _ :
                        return (TY.TYPE, name, local, [self.sexpr_type(t) for t in typ])
            case 'tvar' :
                return (TY.VAR, typ.attrib['name'])
            case 'pred':
                return (TY.FUN, [self.sexpr_type(t) for t in typ] + [(TY.TYPE, 'Bool.bool', None, [])])
            case 'prodt':
                return (TY.PRODT, [self.sexpr_type(t) for t in typ])
            case _:
                raise ValueError(f"sexpr_type: {typ.tag}")

    def _sexpr_term_(self, term):
        match term.tag:
            case 'app':
                return (TM.APP, [self._sexpr_term_(t) for t in term])
            case 'const':
                name = self.name_of(term)
                if len(term) > 0:
                    typ = self.sexpr_type(term[0])
                else:
                    typ = None
                return (TM.CONST, name, typ)
            case 'var' :
                name = self.name_translation(term.attrib['name'])
                return (TM.VAR, name, self.sexpr_type(term[0]))
            case 'case':
                match list(term):
                    case [tm, *pats]:
                        def chk_pat(pat):
                            if pat.tag == 'pat':
                                match list(pat):
                                    case [p,ty,r]:
                                        return (self._sexpr_term_(p), self.sexpr_type(ty), self._sexpr_term_(r))
                                    case _:
                                        raise ValueError(f"_sexpr_term_ - chk_pat: {pat.tag}")
                            else:
                                raise ValueError(f"_sexpr_term_ - chk_pat: {pat.tag}")
                        pats = [chk_pat(p) for p in pats]
                        return (TM.CASE, self._sexpr_term_(tm), pats)
                    case _:
                        raise ValueError(f"_sexpr_term_ - case: {term.tag}")
            case 'num':
                if len(term) > 0:
                    return (TM.NUM, term.attrib['val'], self.sexpr_type(term[0]))
                else:
                    return (TM.NUM, term.attrib['val'], None)
            case 'abs':
                vname = term.attrib['name']
                vname = self.name_translation(vname)
                typ = self.sexpr_type(term[0])
                body = self._sexpr_term_(term[1])
                def bad_var(name):
                    return name == '_'
                if bad_var(vname):
                    [(_, vname, _), body] = variant_bad_vars(bad_var, [(TM.VAR, vname, typ), body], default_variant_bad_name)
                return (TM.ABS, vname, typ, body)
            case 'prod':
                return (TM.PROD, [self._sexpr_term_(t) for t in term])
            case 'as':
                return (TM.AS, term.attrib['name'], self._sexpr_term_(term[0]))
            case 'string':
                return (TM.STRING, term.attrib['val'])
            case _:
                raise ValueError(f"_sexpr_term_: {term.tag}")

    def _norm_term_(self, term):
        #term = deconflict_var_consts(term)
        term = rewrite(self.rewrites, term)
        def app(term):
            match term:
                case (TM.APP, [(TM.CONST, 'Int.nat', _), (TM.APP, [(TM.CONST, 'Int.int', _), x])]):
                    return app(x)
                case (TM.APP, [(TM.CONST, 'Int.nat', _), (TM.NUM, x, _)]):
                    return (TM.NUM, x, (TY.TYPE, '$nat', None, []))
                case (TM.APP, [(TM.CONST, '$lt', _), (TM.APP, [(TM.CONST, 'Int.int', _), x]), (TM.APP, [(TM.CONST, 'Int.int', _), y])]):
                    return app((TM.APP, [(TM.CONST, '$lt', None), x, y]))
                case (TM.APP, [(TM.CONST, '$le', _), (TM.APP, [(TM.CONST, 'Int.int', _), x]), (TM.APP, [(TM.CONST, 'Int.int', _), y])]):
                    return app((TM.APP, [(TM.CONST, '$le', None), x, y]))
                case (TM.APP, [(TM.CONST, '$eq', _), (TM.APP, [(TM.CONST, 'Int.int', _), x]), (TM.APP, [(TM.CONST, 'Int.int', _), y])]):
                    return app((TM.APP, [(TM.CONST, '$eq', None), x, y]))
                case (TM.APP, args):
                    return (TM.APP, [app(arg) for arg in args])
                case (TM.PROD, args):
                    return (TM.PROD, [app(arg) for arg in args])
                case (TM.CASE, tm, pats):
                    return (TM.CASE, app(tm), [(p, ty, app(r)) for (p, ty, r) in pats])
                case (TM.AS, name, tm):
                    return (TM.AS, name, app(tm))
                case (TM.ABS, name, ty, body):
                    return (TM.ABS, name, ty, app(body))
                case _:
                    return term
        return app(term)

    def sexpr_term(self, term):
        return self._norm_term_(self._sexpr_term_(term))

    def _handle_missing_consts(self, consts):
        raise NotImplementedError("Constants are missing")

    def split_statement(self, statement):
        [assms] = [x for x in statement if x.tag == 'prems']
        [concls] = [x for x in statement if x.tag == 'concls']
        assms = [self.sexpr_term(x) for x in assms]
        concls = [self.sexpr_term(x) for x in concls]
        return [(assms, [c]) for c in concls]

    def bad_vname(self, name):
        return name == '_' or name.startswith('_') or name.endswith('_')

    def check_statement(self, statement):
        match statement:
            case (a,b):
                assms, concls = a, b
            case _ :
                [assms] = [x for x in statement if x.tag == 'prems']
                [concls] = [x for x in statement if x.tag == 'concls']
                assms = [self.sexpr_term(x) for x in assms]
                concls = [self.sexpr_term(x) for x in concls]
        tms = variant_bad_vars(self.bad_vname, assms + concls)
        assms = tms[:len(assms)]
        concls = tms[len(assms):]
        for a in assms:
            self.check_all_consts_declared(a)
        for c in concls:
            self.check_all_consts_declared(c)
        return (assms, concls)

    def check_all_consts_declared(self, term):
        bad_consts = {}
        def chk(term):
            match term:
                case (TM.CONST, name, ty):
                    if '$' not in name and '.' not in name and name not in self.local_atom_short_names:
                        bad_consts[name] = ty
        fold_sexpr(chk, term)
        self._handle_missing_consts(bad_consts)

    def parse_def(self, defines, bad_vname=None, variant_bad_name=default_variant_bad_name):
        bodies = []
        for defi in defines:
            [body] = [x for x in defi if x.tag == 'body']
            body = self.sexpr_term(body[0])
            bodies.append(body)
        if bad_vname is not None:
            bodies = variant_bad_vars(bad_vname, bodies, variant_bad_name)

        rets = []
        for body, defi in zip(bodies, defines):
            [argtys] = [x for x in defi if x.tag == 'argtys']
            match [x for x in defi if x.tag == 'retty']:
                case [retty]:
                    retty = self.sexpr_type(retty[0])
                case _:
                    retty = None
            self.decl_free_bound_contextual_vars(body)
            self.check_all_consts_declared(body)
            (head, vars), RHS = parse_EQ(body)
            match head:
                case (TM.VAR, name, _):
                    head_name = name
                case _:
                    raise Exception("BUG parse_def")
            rets.append(((head_name, vars), body, RHS, [self.sexpr_type(a) for a in argtys], retty))
        return rets
    
    def eq_match_2_branches(self, eq):
        ((head, vars), RHS) = parse_EQ(eq)
        varnames = set([v[0] for v in vars])
        branches = []
        def chk(v):
            match v:
                case (TM.VAR, name, _):
                    return name in varnames
                case _:
                    return False
        def vname_of(v):
            match v:
                case (TM.VAR, name, _):
                    return name
                case _:
                    raise ValueError(f"vname_of: {v}")
        def emit(subst, RHS):
            meet = False
            def map(name, ty):
                nonlocal meet
                if name in subst:
                    meet = True
                    return subst[name]
                else:
                    return (TM.VAR, name, ty)
            LHS = [map(name, ty) for name, ty in vars]
            if not meet and len(subst) > 0:
                raise Exception("BUG eq_match_2_branches")
            lvars = collect_vars(LHS)
            branches.append((lvars, head, LHS, RHS))

        def red(tm, subst):
            match tm:
                case (TM.CASE, tm1, pats):
                    match tm1:
                        case (TM.PROD, args) if all(chk(a) for a in args):
                            ks = [vname_of(a) for a in args]
                        case (TM.VAR, name, _) if name in varnames:
                            ks = [name]
                        case _:
                            return emit(subst, tm)
                    for (pat, _, r) in pats:
                        match pat:
                            case (TM.PROD, args) if len(args) == len(ks):
                                args = [(TM.AS, k, a) for (a, k) in zip(args, ks)]
                                pat = (TM.PROD, args)
                            case _ if len(ks) == 1:
                                pat = (TM.AS, ks[0], pat)
                            case (TM.CONST, 'Pure.dummy_pattern', _):
                                dummy = pat
                                args = [dummy] * len(ks)
                                args = [(TM.AS, k, a) for (a, k) in zip(args, ks)]
                                pat = (TM.PROD, args)
                            case _:
                                raise Exception("BUG eq_match_2_branches")
                        pat, r = pattern_as_to_let(pat, r, bad_varnames=None, use_let=False, vs={k: None for k in varnames})
                        match pat:
                            case (TM.PROD, args) if len(args) == len(ks):
                                new_subst = subst.copy()
                                for (a, k) in zip(args, ks):
                                    new_subst[k] = a
                                red(r, new_subst)
                            case _ if len(ks) == 1:
                                new_subst = subst.copy()
                                new_subst[ks[0]] = pat
                                red(r, new_subst)
                            case _:
                                raise Exception("BUG eq_match_2_branches")
                case _:
                    return emit(subst, tm)
        red(RHS, {})
        return branches

    @classmethod
    def language(cls):
        raise NotImplementedError("Exporter.language")

    @classmethod
    def realize(cls, module_name, mlw_path, load_path=None, statistics=None):
        if mlw_path is None:
            xml_file = f"./.cache/xmls/{module_name.replace('.', '/')}.xml"
        else:
            output_dir = cls.lib_dir_of(mlw_path)
            xml_file = os.path.join(output_dir, f"{module_name.replace('.', '/')}.xml")

        if not os.path.exists(xml_file):
            dir = os.path.dirname(xml_file)
            os.makedirs(dir, exist_ok=True)

            if load_path is None and mlw_path is not None:
                load_path = os.path.dirname(mlw_path)
            if load_path: # and os.path.relpath(load_path) not in NO_LOAD_DIR:
                load_path_cmd = ['-L', load_path] + ADDITIONAL_LOADING_PATHS
            else:
                load_path_cmd = ADDITIONAL_LOADING_PATHS

            cmd = ['why3', 'realize'] + load_path_cmd + ['--driver', 'isabelle-realize', '-T', module_name, '-o', dir]
            result = subprocess.run(cmd, capture_output=True, text=True)

            if 'termination of this expression cannot be proved' in result.stderr:
                logger.error(f"Termination proof failed: {mlw_path}")
                exit(1)
                raise RuntimeError(f"Termination proof failed: {mlw_path}")
            # if result.stderr and 'unused variable' not in result.stderr:
            #     logger.error(f"stderr: {result.stderr}")
            #     exit(1)
            #     raise RuntimeError(f"Stderr: {result.stderr}")

            if result.returncode != 0:
                logger.error(f"why3 realize failed with return code {result.returncode}\n{' '.join(cmd)}")
                logger.error(f"stdout: {result.stdout}")
                logger.error(f"stderr: {result.stderr}")
                raise RuntimeError(f"why3 realize failed with return code {result.returncode}")
        
        with open(xml_file, 'r') as f:
            xml = ET.fromstring(f.read())

        return cls.realize_impl(module_name, mlw_path, xml, statistics=statistics)

    @classmethod
    def realize_impl(cls, module_name, mlw_path, xml, statistics=None):
        raise NotImplementedError("realize")

    @classmethod
    def VCG_dir_of(cls, path):
        gen_dir = os.path.join(os.path.splitext(path)[0] + '_vcg', cls.language())
        os.makedirs(gen_dir, exist_ok=True)
        return gen_dir
    
    @staticmethod
    def benchmark_cat_of(path, ofs=0):
        folders = path.split('/')
        for i in range(len(folders) - 2):
            if folders[i] == 'data' and folders[i+1] == 'why3':
                return folders[i+2+ofs]
        raise ValueError(f"BUG depth_of_file: {path} it not under 'data/why3'")

    @staticmethod
    def benchmark_cat_dir_of(path, ofs=0):
        folders = path.split('/')
        for i in range(len(folders) - 2):
            if folders[i] == 'data' and folders[i+1] == 'why3':
                return '/'.join(folders[:i+3+ofs])
            if folders[i] == 'generation' and folders[i+1] in PRINTERS.keys():
                return '/'.join(folders[:i+1+ofs])
        raise ValueError(f"BUG depth_of_file: {path} it not under 'data/why3'")

    @staticmethod
    def depth_of_file(path):
        folders = path.split('/')
        for i in range(len(folders) - 2):
            if folders[i] == 'data' and folders[i+1] == 'why3':
                return len(folders) - (i + 4)
        raise ValueError(f"BUG depth_of_file: {path} it not under 'data/why3'")

    @staticmethod
    def is_single_file(path):
        return Exporter.depth_of_file(path) == 0
    
    @classmethod
    def lib_dir_of(cls, path):
        if Exporter.is_single_file(path):
            return cls.VCG_dir_of(path)
        else:
            dir = os.path.dirname(path)
            gen_dir = os.path.join(dir, 'lib', cls.language())
            os.makedirs(gen_dir, exist_ok=True)
            return gen_dir

    @staticmethod
    def VCG(language, path, cache_db = None, statistics=None):
        path = os.path.abspath(path)
        if language in PRINTERS:
            printer = PRINTERS[language]
        else:
            raise ValueError(f"Unknown language: {language}")

        gen_dir = printer.VCG_dir_of(path)

        with open(path, 'r') as f:
            content = f.read()
        regex = [r'^\s*theory\s+(\w+)', r'^\s*module\s+(\w+)']
        theories = []
        for pattern in regex:
            matches = re.findall(pattern, content)
            theories.extend(matches)
        mlw_name = os.path.splitext(os.path.basename(path))[0]
        mlw_dir = os.path.dirname(path)
        for name in theories:
            printer.realize(mlw_name + '.' + name, path, load_path=mlw_dir)

        dir = os.path.dirname(path)
        if os.path.relpath(dir) in NO_LOAD_DIR:
            loads = ADDITIONAL_LOADING_PATHS
        else:
            loads = ['-L', dir] + ADDITIONAL_LOADING_PATHS

        cmd = ['why3', 'prove'] + loads + ['--driver', 'isabelle', '-o', gen_dir, path]
        result = subprocess.run(cmd, capture_output=True, text=True)
        
        if 'termination of this expression cannot be proved' in result.stderr:
            logger.error(f"Termination proof failed: {path}")
            exit(1)
            raise RuntimeError(f"Termination proof failed: {path}")
        # if result.stderr and 'unused variable' not in result.stderr:
        #     logger.error(f"stderr: {result.stderr}")
        #     exit(1)
        #     raise RuntimeError(f"Stderr: {result.stderr}")

        if result.returncode != 0:
            logger.error(f"why3 VCG failed with return code {result.returncode}")
            logger.error(f"stdout: {result.stdout}\n123{os.path.relpath(dir)}")
            logger.error(f"stderr: {result.stderr}")
            raise RuntimeError(f"why3 VCG failed with return code {result.returncode}")

        xml_files = []
        for file in os.listdir(gen_dir):
            if file.endswith('.xml') and os.path.isfile(os.path.join(gen_dir, file)):
                xml_files.append(os.path.join(gen_dir, file))

        for file in xml_files:
            with open(file, 'r') as f:
                xml = ET.fromstring(f.read())
            if not cache_db or file not in cache_db:
                write_cache = printer.VCG_impl(path, xml, file, statistics=statistics)
                if cache_db is not None and write_cache:
                    cache_db[file] = path
                    cache_db.commit()

    def take_shortname(self, name):
        return self._take_shortname(name, self._atoms, self.loaded_short_atoms)

    @staticmethod
    def _take_shortname(short, decls, loaded):
        if short in loaded:
            match loaded[short]:
                case (wk2, long2, full):
                    done = False
                    for (i,x) in enumerate(long2):
                        if x not in loaded:
                            for w in wk2:
                                decls[w] = x
                            loaded[x] = (wk2, long2[i+1:], full)
                            loaded[short] = str(x)
                            done = True
                            break
                    if not done:
                        raise ValueError(f"Fail to deconflict {short}")
                case str():
                    pass
                case _:
                    raise ValueError(f"corrputed loaded")

    @staticmethod
    def _decl_eles_(decls, loaded, wk, value, full_name=None):
        match value:
            case str():
                decls[wk] = value
            case (short,*longs) as whole:
                if full_name is None:
                    full_name = whole[-1]
                if short in loaded:
                    def is_conflict(name):
                        match loaded[name]:
                            case (wks, _, full):
                                if full == full_name:
                                    wks.append(wk)
                                    decls[wk] = name
                                    return False
                                else:
                                    return True
                            case str() as next:
                                return is_conflict(next)
                            case _:
                                raise ValueError(f"corrputed loaded")
                    if not is_conflict(short):
                        return
                    if len(longs) == 0:
                        raise ValueError(f"Fail to deconflict type {short}")
                    Exporter._take_shortname(short, decls, loaded)
                    Exporter._decl_eles_(decls, loaded, wk, (longs[0], *longs[1:]), full_name)
                else:
                    decls[wk] = short
                    loaded[short] = ([wk], longs, full_name)
            case _:
                raise ValueError(f"bad value {value}")

    def _decl_atom_(self, wk, value):
        Exporter._decl_eles_(self._atoms, self.loaded_short_atoms, wk, value)

    def _decl_type_(self, wk, value):
        Exporter._decl_eles_(self.types, self.loaded_short_types, wk, value)

    def atom(self, name):
        if name in self.local_atom_mapping:
            return self.local_atom_mapping[name]
        if name in self._atoms:
            name = self._atoms[name]
        if name in self.free_bound_contextual_vars:
            _, long, _ = self.loaded_short_atoms[name]
            for x in long:
                if x not in self.loaded_short_atoms:
                    return x
            raise ValueError(f"constant {name} conflicts with a contextual variable")
        return name

    def atomT(self, name):
        if name in self.local_type_mapping:
            return self.local_type_mapping[name]
        if name in self.types:
            name = self.types[name]
        if name in self.free_bound_contextual_vars:
            _, long, _ = self.loaded_short_types[name]
            for x in long:
                if x not in self.loaded_short_types:
                    return x
            raise ValueError(f"constant {name} conflicts with a contextual variable")
        return name
    
    def decl_free_bound_contextual_vars(self, x):
        if isinstance(x, dict):
            vars = x
        else:
            vars = collect_free_bound_vars(x)
        for k in vars:
            self.free_bound_contextual_vars.add(k)

    def reset_free_bound_contextual_vars(self):
        self.free_bound_contextual_vars.clear()

    def dump_module(self, module_name, name):
        mapping = {
            'name': name,
            'types': self.local_types,
            'axioms': self.local_axioms,
            'defs': self.local_defs,
            'datatypes': self.local_datatypes,
            'binops': self.local_binops,
            'binders': self.local_binders,
            'atoms': self.local_atoms,
            'prefix_ops': self.local_prefix_ops
        }
        if self.working_mlw_file is None:
            path = f'./generation/{self.language}/meta/' + module_name.replace('.', '/') + '.yaml'
        else:
            output_dir = type(self).lib_dir_of(self.working_mlw_file)
            path = os.path.join(output_dir, module_name.replace('.', '/') + '.yaml')
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, 'w') as f:
            yaml.dump(mapping, f, Dumper=FlowSeqDumper)
        return mapping
    
    def imports(self, module_name):
        if module_name in EXEMPLIFY_IMPORT or is_tuple_module(module_name):
            return None
        if self.working_mlw_file is None:
            meta_paths = ['./generation/' + self.language + '/meta']
        else:
            meta_paths = [self.lib_dir_of(self.working_mlw_file)]
        meta_name = module_name.replace('.', '/') + '.yaml'
        meta_path = None
        for p in meta_paths:
            path = os.path.join(p, meta_name)
            if os.path.exists(path):
                meta_path = path
                break
        if meta_path is None:
            path = f'./generation/{self.language}/meta/' + meta_name
            if os.path.exists(path):
                meta_path = path
        if meta_path:
            with open(meta_path, 'r') as f:
                mapping = yaml.load(f, Loader=yaml.FullLoader)
        else:
            qualifier = '.'.join(module_name.split('.')[:-1]) if '.' in module_name else None
            if self.working_mlw_file and qualifier:
                is_local = qualifier in self.qualifiers
                if not is_local:
                    dir = os.path.dirname(self.working_mlw_file)
                    mlw_file_path = os.path.join(dir, qualifier + '.mlw')
                    if os.path.exists(mlw_file_path):
                        is_local = True
            else:
                is_local = False
            if is_local:
                mapping = type(self).realize(module_name, self.working_mlw_file, statistics=self.statistics)
            else:
                mapping = type(self).realize(module_name, None, statistics=self.statistics)

        if self.working_mlw_file:
            package = os.path.splitext(os.path.basename(self.working_mlw_file))[0] + '.'
            for _, m in mapping.items():
                if isinstance(m, dict):
                    for k, v in list(m.items()):
                        if k.startswith(package):
                            k = k[len(package):]
                            m[k] = v

        for (wk,value) in mapping['atoms'].items():
            self._decl_atom_(wk, value)
        for (wk,value) in mapping['types'].items():
            self._decl_type_(wk, value)

        self.axioms.update(mapping['axioms'])
        self.defs.update(mapping['defs'])
        self.datatypes.update(mapping['datatypes'])
        self.binops.update(mapping['binops'])
        self.binders.update(mapping['binders'])
        self.prefix_ops.update(mapping['prefix_ops'])
        if 'rewrites' in mapping:
            for name, data in mapping['rewrites'].items():
                name, length = name.split('#')
                self.rewrites[(name, int(length))] = load_rewrite_rule(data)
        return mapping['name']
    
    def gen_imports(self, xml):
        if xml.tag != 'realized':
            raise ValueError(f"gen_imports: xml.tag != 'realized'")
        imports = []
        for x in xml:
            if x.tag == 'require':
                name = x.attrib['name']
                #print(name)
                if '.' not in name and self.working_mlw_file:
                    name = os.path.splitext(os.path.basename(self.working_mlw_file))[0] + '.' + name
                i = self.imports(name)
                if i:
                    imports.append(i)
            else:
                raise ValueError(f"gen_imports: {x.tag}")
        return imports


    def gen_typ_i(self, prec, typ, file):
        raise NotImplementedError("gen_typ_i")

    def gen_typ(self, prec, typ, *args):
        self.gen_typ_i(prec, self.sexpr_type(typ), *args)

    def gen_term_i(self, prec, term):
        raise NotImplementedError("gen_term_i")

    def gen_term(self, prec, term):
        self.gen_term_i(prec, self.sexpr_term(term))
        
    def para(self, expect, actual, code):
        if expect < actual:
            self.file.write('(')
            code()
            self.file.write(')')
        else:
            code()
    
    def generate(self, xml):
        raise NotImplementedError("generate")



class FlowSeqDumper(yaml.SafeDumper):
    pass

def tuple_as_seq(dumper, data):
    # 用标准的 seq tag (tag:yaml.org,2002:seq)，并强制 flow-style
    return dumper.represent_sequence('tag:yaml.org,2002:seq',
                                     data,
                                     flow_style=True)
                                

FlowSeqDumper.add_representer(tuple, tuple_as_seq)

def is_tuple_module(module_name):
    return re.match(r'why3\.Tuple\d+\.Tuple\d+', module_name) is not None