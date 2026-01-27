#!/bin/env python3
from .base import *
import subprocess

NAME_TRANSLATION = str.maketrans({
    ' ': "_", '#': "sh",
    '`': "bq", '~': "tl", '!': "ex",
    '@': "at", '$': "dl", '%': "pc",
    '^': "cf", '&': "et", '*': "as",
    '(': "lp", ')': "rp", '-': "mn",
    '+': "pl", '=': "eq", '[': "lb",
    ']': "rb", '{': "lc", '}': "rc",
    ':': "cl", '"': "dq",
    '<': "ls", '>': "gt", '/': "sl",
    '?': "qu", '\\': "bs", '|': "br",
    ';': "sc", ',': "cm", '\n': "nl"
})

THY_NAME_TRANSLATION = str.maketrans({
    '-': '_'
})

KEYWORDS = {}
QUOTE_KWD = {'value', 'context', 'termination', 'next', 'values', 'text', 'back', 'term', 'from', 'datatype', 'is'}
CONST_NAMES = {'hd', 'tl', 'sum', 'sum\'', 'min', 'max', 'top', 'id', 'inv'}

TYVAR_MAP = {
    'a': 'α', 'b': 'β', 'c': 'γ', 'd': 'δ', 'e': 'ε', 'f': 'ζ', 'g': 'η', 'h': 'θ', 'i': 'ι', 'j': 'κ', 'k': 'κκ', 'l': 'μ', 'm': 'ν', 'n': 'ξ', 'o': 'ο', 'p': 'π', 'q': 'ρ', 'r': 'σ', 's': 'τ', 't': 'υ', 'u': 'φ', 'v': 'χ', 'w': 'ψ', 'x': 'ω', 'y': 'ϊ', 'z': 'ϋ'
}
def tyvar_map(name):
    if name in TYVAR_MAP:
        return TYVAR_MAP[name]
    return "ty'" + name


def variant_name(name):
    while name in KEYWORDS:
        name = name + "'"
    return name

def quote(s):
    if all(c.isalnum() or c == '_' or c == "'" for c in s) and s not in QUOTE_KWD:
        return s
    return f'"{s}"'

def bad_vname(name):
    return name == '_' or name.startswith('_') or name.endswith('_')

def variant_bad_name(name):
    name = name.replace('_', '')
    if name == '':
        return 'x'
    return name

def write_dep(file, lean_name):
    if os.path.exists(file):
        with open(file, 'r') as f:
            deps = f.read().splitlines()
    else:
        deps = []
    entry = f"import {lean_name}"
    if entry not in deps:
        deps.append(entry)
        with open(file, 'a') as f:
            f.write(entry)
            f.write('\n')

def full_name_of_target(target_path):
    curr_dir = target_path
    ret_benchmark = None
    ret_lakefile = None
    while True:
        curr_dir2 = os.path.dirname(curr_dir)
        if curr_dir == curr_dir2:
            break
        benchmark_file = os.path.join(curr_dir, 'Benchmark.lean')
        if os.path.exists(benchmark_file):
            ret_benchmark = benchmark_file
        lakefile = os.path.join(curr_dir, 'lakefile.toml')
        if os.path.exists(lakefile):
            ret_lakefile = lakefile
        if ret_benchmark is not None and ret_lakefile is not None:
            break
        curr_dir = curr_dir2
    if ret_benchmark is None or ret_lakefile is None:
        raise RuntimeError(f"{target_path} must be under ./data/why3 folder")
    full_name = os.path.relpath(target_path, curr_dir).replace('/', '.')
    full_name = full_name.translate(THY_NAME_TRANSLATION)
    return ret_benchmark, ret_lakefile, full_name

class Lean_Exporter(Exporter):
    def __init__(self, file, working_module, working_mlw_file, statistics=None):
        super().__init__(file, 'lean', working_module, working_mlw_file, statistics=statistics)
        self.namespace = None
        self.fixed_vars = {}
        self._in_pat = 0

    @classmethod
    def language(cls):
        return 'lean'

    def name_translation(self, name):
        name = name.translate(NAME_TRANSLATION)
        while name in KEYWORDS: # or name in CONST_NAMES:
            name = name + "'"
        if name.endswith('_') and name != '_':
            name = name[:-1] + "'"
        if name.startswith('_') and name != '_':
            name = 'x' + name
        if name.startswith('infix'):
            name = name.replace('.', 'dot')
        return name

    def gen_typ_i(self, prec, typ):
        match typ:
            case (TY.TYPE, 'fmap.MapImpInt.t', _, [ty]):
                self.gen_typ_i(prec, (TY.TYPE, 'fmap.Fmap.fmap', False, [(TY.TYPE, 'why3.BuiltIn.BuiltIn.int', False, []), ty]))
            case (TY.FUN, args):
                def gen():
                    for (i,t) in enumerate(args):
                        if i > 0:
                            self.file.write(' -> ')
                        if i == len(args) - 1:
                            self.gen_typ_i(25, t)
                        else:
                            self.gen_typ_i(26, t)
                self.para(25, prec, gen)
            case (TY.TYPE, 'fmap.Fmap.fmap', _, [a,b]):
                self.file.write('Finmap (fun (_ : ')
                self.gen_typ_i(1024, a)
                self.file.write(') => ')
                self.gen_typ_i(0, b)
                self.file.write(')')
            case (TY.TYPE, name, local, children) if name in self.types and self.types[name] != name:
                self.gen_typ_i(prec, (TY.TYPE, self.types[name], local, children))
            case (TY.TYPE, name, _, []):
                if ' ' in name and 1023 < prec:
                    self.file.write('(')
                    self.file.write(name)
                    self.file.write(')')
                else:
                    self.file.write(name)
            case (TY.TYPE, name, _, [t]):
                def gen():
                    self.file.write(name)
                    self.file.write(' ')
                    if t[0] == TY.TYPE and t[3] != [] and t[3][0] == TY.TYPE and t[3][3] != []:
                        pass
                    self.gen_typ_i(1024, t)
                self.para(1000, prec, gen)
            case (TY.TYPE, name, _, children) :
                def gen():
                    self.file.write(name)
                    for t in children:
                        self.file.write(' ')
                        self.gen_typ_i(1024, t)
                self.para(1000, prec, gen)
            case (TY.VAR, name):
                self.file.write(tyvar_map(name))
            case (TY.PRODT, []):
                self.file.write('Unit')
            case (TY.PRODT, children):
                def gen():
                    for (i,t) in enumerate(children):
                        if i > 0:
                            self.file.write(' × ')
                            self.gen_typ_i(35, t)
                        else:
                            self.gen_typ_i(36, t)
                self.para(35, prec, gen)
            case _ :
                raise ValueError(f"Unknown type: {typ}")

    def gen_typ_i_tvars(self, prec, ty):
        tvs = {tyvar_map(tv) for tv in collect_tvars(ty)}
        if tvs:
            def gen():
                for tv in tvs:
                    self.file.write(" {" + tv + " : Type}")
                    self.file.write(" -> [Inhabited " + tv + "]")
                    #self.file.write(" -> [DecidableEq " + tv + "]")
                    self.file.write(' -> ')
                self.gen_typ_i(25, ty)
            self.para(25, prec, gen)
        else:
            self.gen_typ_i(prec, ty)


    def gen_term_i(self, prec, term):
        def gen_app(f, args):
            def gen():
                self.gen_term_i(1023, f)
                for a in args:
                    self.file.write(' ')
                    self.gen_term_i(1024, a)
            self.para(1023, prec, gen)

        def nth_exemplify(l):
            match l:
                case (TM.VAR, 'c', _):
                    return False
                case (TM.CONST, 'c', _, _):
                    return False
                case _:
                    return True

        match term:
            case (TM.APP, [x]):
                return self.gen_term_i(prec, x)
            case (TM.APP, [(TM.CONST, 'nth_opt$nat', _), l, i]) if nth_exemplify(l):
                self.gen_term_i(1024, l)
                self.file.write('[')
                self.gen_term_i(0, i)
                self.file.write(']?')
            case (TM.APP, [(TM.CONST, 'nat$nth', _), l, i]) if nth_exemplify(l):
                def gen():
                    self.gen_term_i(1024, l)
                    self.file.write('[')
                    self.gen_term_i(0, i)
                    self.file.write(']!')
                self.para(1023, prec, gen)
            case (TM.APP, [(TM.CONST, 'HOL.If', _), C, A, B]):
                def gen():
                    self.file.write('if ')
                    self.gen_term_i(0, C)
                    self.file.write(' then ')
                    self.gen_term_i(0, A)
                    self.file.write(' else ')
                    self.gen_term_i(0, B)
                self.para(2, prec, gen)
            case (TM.CONST, '$nil', ty):
                if ty is None:
                    self.file.write('[]')
                else:
                    self.file.write('([] : ')
                    self.gen_typ_i(0, ty)
                    self.file.write(')')
            case (TM.APP, [(TM.CONST, 'HOL.Let', _), v, (TM.ABS, x, t, b)]):
                def gen():
                    self.file.write('let ')
                    self.file.write(x)
                    if t is not None:
                        self.file.write(' : ')
                        self.gen_typ_i(0, t)
                    self.file.write(' := ')
                    self.gen_term_i(3, v)
                    self.file.write('; ')
                    self.gen_term_i(2, b)
                self.para(2, prec, gen)
            case (TM.APP, [(TM.CONST, 'why3.HighOrd.HighOrd.infix_at', _), *args]):
                return self.gen_term_i(prec, (TM.APP, args))
            case (TM.APP, [(TM.APP, [(TM.CONST, 'why3.HighOrd.HighOrd.infix_at', _), *args1]), *args2]):
                return self.gen_term_i(prec, (TM.APP, args1 + args2))
            # case (TM.APP, [(TM.CONST, 'map.Map.get', _), f, x]):
            #     return self.gen_term_i(prec, (TM.APP, [f, x]))
            case (TM.APP, [(TM.CONST, 'set.Set.singleton', ty), x]):
                if ty is not None:
                    self.file.write('(')
                self.file.write('{')
                self.gen_term_i(0, x)
                self.file.write('}')
                if ty is not None:
                    self.file.write(':')
                    self.gen_typ_i(0, ty)
                    self.file.write(')')
            case (TM.APP, [(TM.CONST, 'seq.Seq.singleton', _), x]):
                self.file.write('[')
                self.gen_term_i(0, x)
                self.file.write(']')
            #case (TM.APP, [(TM.CONST, 'array.Array.mixfix_lblsmnrb', _), l, i, v]) \
            #   | (TM.APP, [(TM.CONST, 'seq.Seq.set', _), l, i, v]) \
            #   | (TM.APP, [(TM.CONST, 'seq.Seq.mixfix_lblsmnrb', _), l, i, v]):
            #    ivs = [(i,v)]
            #    while True:
            #        match l:
            #            case (TM.APP, [(TM.CONST, 'array.Array.mixfix_lblsmnrb', _), l2, i2, v2]) \
            #               | (TM.APP, [(TM.CONST, 'seq.Seq.set', _), l2, i2, v2]) \
            #               | (TM.APP, [(TM.CONST, 'seq.Seq.mixfix_lblsmnrb', _), l2, i2, v2]):
            #                ivs.append((i2,v2))
            #                l = l2
            #            case _:
            #                break
            #    def gen():
            #        self.gen_term_i(1000, l)
            #        self.file.write('[')
            #        for (j,(n,v)) in enumerate(ivs):
            #            if j > 0:
            #                self.file.write(', ')
            #            self.file.write(self._atoms['$.nat'])
            #            self.file.write(' ')
            #            self.gen_term_i(1000, n)
            #            self.file.write(' := ')
            #            self.gen_term_i(0, v)
            #        self.file.write(']')
            #    self.para(900, prec, gen)
            case (TM.APP, [(TM.CONST, opr, _), a, b]) if opr in self.binops:
                (op, prec_a, prec_l, prec_r) = self.binops[opr]
                def gen():
                    self.gen_term_i(prec_l, a)
                    self.file.write(op)
                    self.gen_term_i(prec_r, b)
                self.para(prec_a, prec, gen)
            case (TM.APP, [(TM.CONST, opr, _), a]) if opr in self.prefix_ops:
                (op, prec_a, prec_x) = self.prefix_ops[opr]
                def gen():
                    self.file.write(op)
                    self.gen_term_i(prec_x, a)
                self.para(prec_a, prec, gen)
            case (TM.APP, [(TM.CONST, binder, _), body]) if binder in self.binders:
                (symb, prec_b) = self.binders[binder]
                vs = []
                while True:
                    match body:
                        case (TM.ABS, v, t, b):
                            vs.append((v, t))
                            body = b
                        case (TM.APP, [(TM.CONST, binder2, _), b]) if binder2 == binder:
                            body = b
                        case _:
                            break
                def gen():
                    self.file.write(symb)
                    for (i, (v, t)) in enumerate(vs):
                        if i > 0:
                            self.file.write(' ')
                        self.file.write('(')
                        self.file.write(v)
                        self.file.write(' : ')
                        self.gen_typ_i(0, t)
                        self.file.write(')')
                    self.file.write(', ')
                    self.gen_term_i(prec_b, body)
                self.para(prec_b, prec, gen)
            case (TM.CONST, name, ty):
                # if name == 'div':
                #     name = self.namespace + '.' + name
                #     self.file.write(name)
                # else:
                name = self.atom(name)
                if ty is not None and \
                    (name in ['∅', 'Tree.tree.Empty'] \
                    or (name in ['TreeRank.tree.E', 'what.Result', 'm2.mk', 'const', 'olift', 'subst_id_fo_term', 'olifts_symbol'] and self._in_pat == 0)\
                    or has_tvar(ty) and ty[0] != TY.FUN):
                    self.file.write(f'({name} : ')
                    self.gen_typ_i(0, ty)
                    self.file.write(')')
                else:
                    self.file.write(name)
            case (TM.CASE, tm, pats):
                def gen():
                    self.file.write('match ')
                    self.gen_term_i(3, tm)
                    self.file.write(' with')
                    for (i,(p,_,r)) in enumerate(pats):
                        self.file.write(' | ')
                        self._in_pat += 1
                        self.gen_term_i(3, p)
                        self._in_pat -= 1
                        self.file.write(' => ')
                        self.gen_term_i(3, r)
                self.para(2, prec, gen)
            case (TM.PROD, children):
                self.file.write('(')
                for (i,t) in enumerate(children):
                    if i > 0:
                        self.file.write(', ')
                    self.gen_term_i(0, t)
                self.file.write(')')
            case (TM.APP, [f, *args]):
                gen_app(f, args)
            case (TM.VAR, name, _):
                self.file.write(name)
            case (TM.NUM, val, ty):
                def gen():
                    self.file.write(val)
                    if ty:
                        self.file.write(' : ')
                        self.gen_typ_i(0, ty)
                if ty:
                    self.para(~1, prec, gen)
                else:
                    self.para(1024, prec, gen)
            case (TM.STRING, val):
                self.file.write('([')
                for i, c in enumerate(val):
                    if i > 0:
                        self.file.write(', ')
                    self.file.write(f'{ord(c) % 256}')
                self.file.write('] : List (BitVec 8))')
            case (TM.ABS, vname, typ, body):
                def gen():
                    if typ is None:
                        self.file.write('fun ')
                        self.file.write(vname)
                        self.file.write(' => ')
                        self.gen_term_i(0, body)
                    else:
                        self.file.write('fun (')
                        self.file.write(vname)
                        self.file.write(' : ')
                        self.gen_typ_i(0, typ)
                        self.file.write(') => ')
                        self.gen_term_i(0, body)
                self.para(1, prec, gen)
            case (TM.AS, name, tm):
                self.file.write(name)
                self.file.write('@')
                self.gen_term_i(1024, tm)
            case _ :
                raise ValueError(f"gen_term_i: {term}")

    def gen_instance(self, name, goal_name, params):
        axiom_name = 'inhabited_axiom_' + name
        self.file.write(f'axiom {axiom_name}')
        for p in params:
            self.file.write(' {' + f'{p} : Type' + '}')
            self.file.write(f' [Inhabited {p}]')
        self.file.write(f' : {goal_name} ')
        if len(params) > 0:
            self.file.write('(')
            self.file.write(name)
            for i, p in enumerate(params):
                self.file.write(f' {p}')
            self.file.write(')')
        else:
            self.file.write(name)
        self.file.write(f'\nattribute [instance] {axiom_name}\n')

    def gen_typedecl(self, typ):
        name = self.name_of(typ)
        if '.' in name:
            raise ValueError(f"Typedecl: {name}")
        if name in ['word']:
            return
        full_name = self.qualify(name)
        if full_name in self.types:
            return
        [params] = [x for x in typ if x.tag == 'params']
        self.file.write(f"axiom {name} :")
        for p in params:
            self.file.write(f' Type ->')
        self.file.write(' Type\n')
        params = [tyvar_map(p.attrib['name']) for p in params]
        self.gen_instance(name, 'Inhabited', params)
        #self.gen_instance(name, 'DecidableEq', params)
        self.decl_type(name, (self.namespace + '.' + name,))

    def gen_param(self, param):
        name = self.name_of(param)
        if '.' in name:
            raise ValueError(f"gen_param: {name}")
        full_name = self.qualify(name)
        if full_name in self._atoms or full_name in self.binops:
            return
        if 'path' in param.attrib and param.attrib['path'] != self.working_module:
            raise ValueError(f"Param: {name}")
        if name == 'abs':
            self._decl_atom_(name, (name, self.namespace + '.' + name))
        self.decl_atom(name, (self.namespace + '.' + name,))
        self.file.write(f"axiom {name} : ")
        self.gen_typ_i_tvars(0, self.sexpr_type(param[0]))
        self.file.write("\n")

    def _handle_missing_consts(self, bad_consts):
        for name, ty in bad_consts.items():
            if name == '∅':
                continue
            self.file.write(f"axiom {name} : ")
            self.gen_typ_i_tvars(0, ty)
            self.file.write("\n")
            self.decl_atom(name, (self.namespace + '.' + name,))

    def gen_statement(self, assms, concls, pass_dummy = False, to_unfold_let = False):
        # if len(concls) > 1:
        #     raise ValueError(f"gen_statement: concls more than one")
        vars = {}
        tvs = set()
        for a in assms:
            collect_vars(a, vars)
            collect_tm_tvars(a, tvs)
            self.decl_free_bound_contextual_vars(a)
        if pass_dummy:
            concls = [subst_dummy(c) for c in concls]
        for c in concls:
            collect_vars(c, vars)
            collect_tm_tvars(c, tvs)
            self.decl_free_bound_contextual_vars(c)
        tvs = {tyvar_map(tv) for tv in tvs}
        for tv in tvs:
            self.file.write(" {" + tv + " : Type}")
        for tv in tvs:
            self.file.write(f" [Inhabited {tv}]")
            #self.file.write(f" [DecidableEq {tv}]")
        for (k,v) in vars.items():
            self.file.write(f" ({k} : ")
            self.gen_typ_i(0, v)
            self.file.write(')')
        for (i,a) in enumerate(assms):
            self.file.write(f" (fact{i} : ")
            if to_unfold_let:
                a = unfold_let(a)
            self.gen_term_i(0, a)
            self.file.write(')')
        self.file.write(' : ')
        if len(concls) > 1:
            prec = 36
        else:
            prec = 0
        for (i,c) in enumerate(concls):
            if i > 0:
                self.file.write(' ∧ ')
            if to_unfold_let:
                c = unfold_let(c)
            self.gen_term_i(prec, c)
        self.file.write('\n')
    
    def gen_axiom(self, axiom):
        name = self.name_of(axiom)
        if '.' in name:
            raise ValueError(f"gen_axiom: {name}")
        self.decl_axiom(name, self.namespace + '.' + name)
        assms, concl = self.check_statement(axiom)
        self.file.write(f"axiom {name}")
        self.gen_statement(assms, concl, pass_dummy=True, to_unfold_let=True)

        # statements = self.split_statement(axiom)
        # for (i,s) in enumerate(statements):
        #     if i == 0:
        #         local_name = name
        #     else:
        #         local_name = name + '\'' + str(i)
        #     self.decl_axiom(local_name, self.namespace + '.' + local_name)
        #     assms, concl = self.check_statement(s)
        #     self.file.write(f"axiom {local_name}")
        #     self.gen_statement(assms, concl, pass_dummy=True)


    def gen_goal(self, goal):
        name = self.name_translation(goal.attrib['name'])
        full_name = self.qualify(name)
        if full_name in self.axioms:
            return
        assms, concl = self.check_statement(goal)
        self.file.write(f"theorem {name}")
        self.gen_statement(assms, concl, pass_dummy=True)
        self.file.write('  := sorry\n')
        # statements = self.split_statement(goal)
        # for (i,s) in enumerate(statements):
        #     if i == 0:
        #         local_name = name
        #     else:
        #         local_name = name + '\'' + str(i)
        #     assms, concl = self.check_statement(s)
        #     self.file.write(f"lemma {local_name}")
        #     self.gen_statement(assms, concl, pass_dummy=True)
        #     self.file.write('  := sorry\n')

    def gen_def(self, defi):
        name = self.name_of(defi)
        if name.startswith('infix'):
            pass
        if '.' in name:
            raise ValueError(f"gen_def: {name}")
        full_name = self.qualify(name)
        if full_name in self.defs or full_name in self._atoms or full_name in self.binops:
            return
        [((name, args), expr, RHS, argtys, retty)] = self.parse_def([defi], bad_vname)

        self.decl_atom(name, (self.namespace + '.' + name,))
        self.file.write(f"noncomputable def {name}")

        if retty is None:
            retty = (TY.TYPE, '_', None, [])
        typ = (TY.FUN, argtys + [retty])
        self.fixed_vars[name] = typ

        tvs = {tyvar_map(tv) for tv in collect_tvars(typ)}
        for tv in tvs:
            self.file.write(" {" + tv + " : Type}")
        for tv in tvs:
            self.file.write(f" [Inhabited {tv}]")
            #self.file.write(f" [DecidableEq {tv}]")
        for x, ty in args:
            self.file.write(f" ({x} : ")
            self.gen_typ_i(0, ty)
            self.file.write(')')

        self.file.write(" := ")
        self.gen_term_i(0, RHS)
        self.file.write("\n")
        self.fixed_vars.clear()

    def gen_fun(self, fun):
        defs = self.parse_def(fun, bad_vname)
        for (name, _), _, _, _, _ in defs:
            if name in self.defs or name in self._atoms or name in self.binops:
                return
        for (name, _), _, _, _, _ in defs:
            if '.' in name:
                raise ValueError(f"gen_fun: {name}")

        is_mutual = len(defs) > 1
        if is_mutual:
            self.file.write('mutual\n')
        for (name, _),expr,_,argtys,retty in defs:
            self.file.write(f"noncomputable def {name}")
            if retty is None:
                retty = (TY.TYPE, 'Prop', None, [])
            typ = (TY.FUN, argtys + [retty])
            tvs = {tyvar_map(tv) for tv in collect_tvars(typ)}
            for tv in tvs:
                self.file.write(" {" + tv + " : Type}")
            for tv in tvs:
                self.file.write(f" [Inhabited {tv}]")
                #self.file.write(f" [DecidableEq {tv}]")
            self.file.write(' : ')
            self.gen_typ_i(0, typ)
            self.file.write('\n')

            self.fixed_vars[name] = typ
            self.decl_atom(name, (self.namespace + '.' + name,))

            for _, _, LHS, RHS in self.eq_match_2_branches(expr):
                self.file.write('  | ')
                for i, param in enumerate(LHS):
                    if i > 0:
                        self.file.write(', ')
                    self.gen_term_i(1024, param)
                self.file.write(' => ')
                self.gen_term_i(0, RHS)
                self.file.write('\n')
        if is_mutual:
            self.file.write('end\n')

    def gen_datatype(self,datatype):
        def is_inductive(datatype):
            def chk(dt):
                [constrs] = [x for x in dt if x.tag == 'constrs']
                return all(('name' not in c and all('name' not in a.attrib for a in c)) for c in constrs)
            return all(chk(dt) for dt in datatype)
        def gen_inductive(datatype):
            is_mutual = len(datatype) > 1
            if is_mutual:
                self.file.write('mutual\n')
            for dt in datatype:
                [params] = [x for x in dt if x.tag == 'params']
                [constrs] = [x for x in dt if x.tag == 'constrs']
                params = [p.attrib['name'] for p in params]
                typ_name = dt.attrib['name']
                self.decl_type(typ_name, (self.namespace + '.' + typ_name,))
                self.file.write(f"inductive {typ_name}")
                for param in params:
                    self.file.write(f' ({tyvar_map(param)} : Type)')
                self.file.write(' where\n')
                target_typ = (TY.TYPE, typ_name, True,
                                [(TY.VAR, param) for param in params])
                for c in constrs:
                    self.file.write('  | ')
                    cname = c.attrib['name']
                    self.decl_atom(cname, (self.namespace + '.' + typ_name + '.' + cname,))
                    self.local_atom_mapping[cname] = typ_name + '.' + cname
                    self.file.write(cname)
                    self.file.write(' : ')
                    self.gen_typ_i(0, (TY.FUN, [self.sexpr_type(a[0]) for a in c] + [target_typ]))
                    self.file.write('\n')
            if is_mutual:
                self.file.write('end\n')
            for dt in datatype:
                [params] = [x for x in dt if x.tag == 'params']
                [constrs] = [x for x in dt if x.tag == 'constrs']
                params = [tyvar_map(p.attrib['name']) for p in params]
                typ_name = dt.attrib['name']
                self.gen_instance(typ_name, 'Inhabited', params)
                #self.gen_instance(typ_name, 'DecidableEq', params)

        def is_structure(datatype):
            if len(datatype) != 1:
                return False
            dt = datatype[0]
            [constrs] = [x for x in dt if x.tag == 'constrs']
            return len(constrs) == 1 and\
                all('name' in a.attrib for a in constrs[0])
                #constrs[0].attrib['name'] == dt.attrib['name'] and\
        
        def gen_structure(datatype):
            dt = datatype[0]
            [params] = [x for x in dt if x.tag == 'params']
            [constrs] = [x for x in dt if x.tag == 'constrs']
            typ_name = dt.attrib['name']
            self.decl_type(typ_name, (self.namespace + '.' + typ_name,))
            params = [tyvar_map(p.attrib['name']) for p in params]
            self.file.write(f"structure {typ_name}")
            for param in params:
                self.file.write(f' ({param} : Type)')
            self.file.write(' where\n')
            constr = constrs[0]
            #self.decl_atom(typ_name, (self.namespace + '.' + typ_name,))
            cname = constr.attrib['name']
            self.decl_atom(cname, (self.namespace + '.' + typ_name + '.mk',))
            self.local_atom_mapping[cname] = typ_name + '.mk'
            for a in constr:
                self.file.write('  ')
                aname = a.attrib['name']
                self.file.write(aname)
                self.decl_atom(aname, (self.namespace + '.' + typ_name + '.' + aname,))
                self.local_atom_mapping[aname] = typ_name + '.' + aname
                self.file.write(' : ')
                self.gen_typ_i(0, self.sexpr_type(a[0]))
                self.file.write('\n')
            self.gen_instance(typ_name, 'Inhabited', params)
            #self.gen_instance(typ_name, 'DecidableEq', params)

        if is_inductive(datatype):
            gen_inductive(datatype)
        elif is_structure(datatype):
            gen_structure(datatype)
        else:
            raise ValueError(f"gen_datatype: {datatype}")

    def gen_inductive(self, xml):
        sections = [(self.name_of(x), x) for x in xml]
        for (name, _) in sections:
            if '.' in name:
                raise ValueError(f"gen_inductive: {name}")
            full_name = self.qualify(name)
            if full_name in self.defs or full_name in self._atoms or full_name in self.binops:
                return

        is_mutual = len(sections) > 1
        if is_mutual:
            self.file.write('mutual\n')

        prems_conclss = []
        #consts = set()
        for name, body in sections:
            #consts.add(name)
            rules = [x for x in body if x.tag == 'rule']
            prems_concls = []
            for rule in rules:
                [prems] = [x for x in rule if x.tag == 'prems']
                [concl] = [x for x in rule if x.tag != 'prems']
                prems = [self.sexpr_term(prem) for prem in prems]
                concl = self.sexpr_term(concl)
                rule_name = self.name_of(rule)
                prems_concls.append((rule_name, prems, concl))
                for prem in prems:
                    self.check_all_consts_declared(prem)
                    self.decl_free_bound_contextual_vars(prem)
                self.check_all_consts_declared(concl)
                self.decl_free_bound_contextual_vars(concl)
            prems_conclss.append(prems_concls)

        for (name, body), prems_concls in zip(sections, prems_conclss):
            self.file.write(f"inductive {name}")
            typ = self.sexpr_type(body[0])
            tvs = collect_tvars(typ)
            tvs = {tyvar_map(tv) for tv in tvs}
            for tv in tvs:
                self.file.write(" {" + f" {tv} : Type" + "}")
            self.file.write(' : ')
            self.gen_typ_i(0, typ)
            self.file.write(' where\n')
            for rule_name, prems, concl in prems_concls:
                if '.' in rule_name:
                    raise ValueError(f"gen_inductive: {rule_name}")
                vars = {}
                for expr in prems:
                    collect_vars(expr, vars)
                collect_vars(concl, vars)
                for (name2, _) in sections:
                    if name2 in vars:
                        del vars[name2]

                self.file.write(' | ')
                self.file.write(rule_name)
                for (k,v) in vars.items():
                    self.file.write(f" ({k} : ")
                    self.gen_typ_i(0, v)
                    self.file.write(')')
                self.file.write(' : ')
                for expr in prems:
                    self.gen_term_i(26, expr)
                    self.file.write(" → ")
                self.gen_term_i(25, concl)
                self.file.write('\n')
            self.decl_atom(name, (self.namespace + '.' + name,))

        if is_mutual:
            self.file.write('end\n')

    def generate(self, xml, gen_goal, namespace=None):
        if not namespace:
            namespace = xml.get('name')
        if namespace == 'Sum':
            head = self.working_module.split('.')[0]
            namespace = head + '.' + namespace
        if namespace == 'ToList':
            head = self.working_module.split('.')[0]
            namespace = head + '.' + namespace
        if namespace == 'Set':
            namespace = 'MySet'
        self.namespace = namespace
        realized = [x for x in xml if x.tag == 'realized']
        imports = []
        for x in realized:
            imports.extend(self.gen_imports(x))
        # def filter_import(i):
        #     [s,t] = i.split('.')
        #     if s in self.qualifiers:
        #         if self.working_mlw_file is None:
        #             return t
        #         elif Exporter.is_single_file(self.working_mlw_file):
        #             return "./" + t
        #         else:
        #             return "../" * (Exporter.depth_of_file(self.working_mlw_file) + 1) + '.lib/isabelle/' + t
        #     return i
        # imports = list(map(filter_import, imports))
        for imp in imports:
            self.file.write(f"import {imp}\n")
        self.file.write(f"open Classical\n")
        self.file.write(f"open Lean4Why3\n")
        self.file.write(f"namespace {namespace}\n")

        for x in xml:
            match x.tag:
                case 'realized':
                    pass
                case 'typedecl':
                    self.gen_typedecl(x)
                case 'axiom':
                    self.gen_axiom(x)
                case 'lemma':
                    if gen_goal:
                        self.gen_goal(x)
                    else:
                        self.gen_axiom(x)
                case 'definition':
                    self.gen_def(x)
                case 'datatypes':
                    self.gen_datatype(x)
                case 'param':
                    self.gen_param(x)
                case 'function':
                    self.gen_fun(x)
                case 'inductive':
                    self.gen_inductive(x)
                case _:
                    raise ValueError(f"Unknown XML node {x}")
            self.reset_free_bound_contextual_vars()
        self.file.write(f"end {namespace}\n")

    @classmethod
    def realize_impl(cls, module_name, mlw_path, xml, statistics=None):
        parts = module_name.split('.')
    
        if mlw_path is None:
            # system library
            output_dir = "./generation/lean/Why3/" + '/'.join(module_name.split('.')[:-1])
            full_name = "Why3." + module_name
            full_name = full_name.translate(THY_NAME_TRANSLATION)
            benchmark_lst = "./generation/lean/Why3.lean"
        else:
            output_dir = os.path.join(cls.lib_dir_of(mlw_path), *module_name.split('.')[:-1])
            benchmark_lst, _, full_name = full_name_of_target(output_dir)
            full_name += '.' + module_name.split('.')[-1]

        os.makedirs(output_dir, exist_ok=True)
        write_dep(benchmark_lst, full_name)
        short_name = full_name.split('.')[-1]

        thy_file = os.path.join(output_dir, short_name + '.lean')
        logger.info(f"Generating the dependency {thy_file}")
        if os.path.exists(thy_file) and not os.access(thy_file, os.W_OK):
            logger.info(f"{thy_file} exists and is not writable, skipping...")
        else:
            with open(thy_file, 'w') as f:
                exporter = Lean_Exporter(f, module_name, mlw_path, statistics=statistics)
                if exporter.qualifiers is None:
                    #TODO: BUG???
                    exporter.qualifiers = ["_".join(module_name.split('.')[:-2])]
                exporter.generate(xml, False, short_name)

        return exporter.dump_module(module_name, full_name)

    @classmethod
    def VCG_impl(cls, mlw_path, xml, xml_path, statistics=None):
        output_dir = os.path.dirname(xml_path)
        benchmark_lst, lakefile, full_name = full_name_of_target(output_dir)
        short_name = os.path.splitext(os.path.basename(xml_path))[0]
        full_name += '.' + short_name
        path = os.path.join(output_dir, short_name + '.lean')
        logger.info(f"Generating the VC {path}")
        if os.path.exists(path) and not os.access(path, os.W_OK):
            logger.info(f"{path} exists and is not writable, skipping VCG...")
        else:
            with open(path, 'w') as file:
                exporter = cls(file, 'VCG_endpoint', mlw_path, statistics=statistics)
                exporter.generate(xml, True, short_name)
        ret = True #syntax_check(path, os.path.dirname(lakefile))
        # ret = syntax_check(path, print=False)
        # if not ret:
        #     with open(path, 'w') as file:
        #         exporter = cls(file, 'VCG_endpoint', mlw_path, easy_mode=True)
        #         exporter.generate(xml, short_name)
        #     ret = syntax_check(path)
        write_dep(benchmark_lst, full_name)
        return ret

PRINTERS['lean'] = Lean_Exporter

def syntax_check(file, dir, print=True):
    try:
        file = os.path.relpath(file, dir)
        result = subprocess.run(['lake', 'build', file], 
                              capture_output=True, text=True, timeout=1800, cwd=dir)
        if print:
            if result.returncode == 0:
                logger.info(f"Syntax check passed for {file}")
            else:
                logger.error(f"Syntax check failed for {file}:\n{result.stderr}")
        return result.returncode == 0
    except subprocess.TimeoutExpired:
        if print:
            logger.error(f"Syntax check timed out for {file}")
        return False
    except Exception as e:
        if print:
            logger.error(f"Syntax check error for {file}: {e}")
        return False