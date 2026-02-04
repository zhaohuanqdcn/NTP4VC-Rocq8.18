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
QUOTE_KWD = {}
CONST_NAMES = {}

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

class Rocq_Exporter(Exporter):
    def __init__(self, file, working_module, working_mlw_file, namespace, statistics=None):
        super().__init__(file, 'rocq', working_module, working_mlw_file, type_as_term=True, statistics=statistics)
        self.namespace = namespace
        self.fixed_vars = {}
        self._in_pat = 0
        self.needs_countable = False

    @classmethod
    def language(cls):
        return 'rocq'

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
                            self.gen_typ_i(0, t)
                        else:
                            self.gen_typ_i(102, t)
                self.para(101, prec, gen)
            case (TY.TYPE, name, local, children) if name in self.types and self.atomT(name) != name:
                self.gen_typ_i(prec, (TY.TYPE, self.atomT(name), local, children))
            case (TY.TYPE, name, _, []):
                if name.startswith('bv '):
                    _, num = name.split(' ')
                    name = self.atomT('$bv') + ' ' + num
                if ' ' in name and 190 < prec:
                    self.file.write('(')
                    self.file.write(name)
                    self.file.write(')')
                else:
                    self.file.write(name)
            case (TY.TYPE, name, _, children) :
                def gen():
                    self.file.write(name)
                    for t in children:
                        self.file.write(' ')
                        self.gen_typ_i(200, t)
                self.para(190, prec, gen)
            case (TY.VAR, name):
                self.file.write(tyvar_map(name))
            case (TY.PRODT, []):
                self.file.write('unit')
            case (TY.PRODT, children):
                def gen():
                    clen = len(children)
                    for (i,t) in enumerate(children):
                        if i > 0:
                            self.file.write(' * ')
                            if i < clen - 1:
                                self.file.write('(')
                            self.gen_typ_i(161, t)
                        else:
                            self.gen_typ_i(160, t)
                    for _ in range(clen - 2):
                        self.file.write(')')
                self.para(160, prec, gen)
            case _ :
                raise ValueError(f"Unknown type: {typ}")

    def gen_typ_i_tvars(self, prec, ty):
        tvs = {tyvar_map(tv) for tv in collect_tvars(ty)}
        if tvs:
            self.file.write('forall')
            for tv in tvs:
                self.file.write(" {" + tv + " : Type}")
                self.file.write(" `{Inhabited " + tv + "}")
                if self.needs_countable:
                    self.file.write(" `{Countable " + tv + "}")
                #self.file.write(" -> [DecidableEq " + tv + "]")
            self.file.write(', ')
            self.gen_typ_i(0, ty)
        else:
            self.gen_typ_i(prec, ty)

    def gen_term_i(self, prec, term):
        def gen_app(f, args):
            def gen():
                self.gen_term_i(190, f)
                for a in args:
                    self.file.write(' ')
                    self.gen_term_i(200, a)
            self.para(190, prec, gen)

        def nth_exemplify(l):
            match l:
                case (TM.VAR, 'c', _):
                    return False
                case (TM.CONST, 'c', _, _):
                    return False
                case _:
                    return True

        def is_constant_set(S):
            eles = []
            while True:
                match S:
                    case (TM.APP, [(TM.CONST, 'set.Fset.add', _), x, S]):
                        eles.append(x)
                    case (TM.APP, [(TM.CONST, 'set.Set.add', _), x, S]):
                        eles.append(x)
                    case (TM.APP, [(TM.CONST, 'bag.Bag.add', _), x, S]):
                        eles.append(x)
                    case (TM.CONST, 'set.Fset.empty', _) | (TM.CONST, 'set.Set.empty', _) | (TM.CONST, 'bag.Bag.empty', _):
                        return eles
                    case (TM.APP, [(TM.CONST, 'set.Fset.singleton', _), x]):
                        eles.append(x)
                        return eles
                    case (TM.APP, [(TM.CONST, 'set.Set.singleton', _), x]):
                        eles.append(x)
                        return eles
                    case (TM.APP, [(TM.CONST, 'bag.Bag.singleton', _), x]):
                        eles.append(x)
                        return eles
                    case _:
                        return None

        match term:
            case (TM.APP, [x]):
                return self.gen_term_i(prec, x)
            case (TM.APP, [(TM.CONST, 'Groups.uminus_class.uminus', _), (TM.NUM, val, ty)]):
                self.gen_term_i(prec, (TM.NUM, "-" + val, ty))
            case (TM.APP, [(TM.CONST, 'Groups.uminus_class.uminus', _), x]):
                raise ValueError(f"gen_term_i: {term}")
            case (TM.APP, [(TM.CONST, 'HOL.If', _), C, A, B]):
                def gen():
                    self.file.write('if decide ')
                    self.gen_term_i(200, C)
                    self.file.write(' then ')
                    self.gen_term_i(0, A)
                    self.file.write(' else ')
                    self.gen_term_i(0, B)
                self.para(2, prec, gen)
            case (TM.CONST, '$nil', ty):
                if ty is None or self._in_pat > 0:
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
                    self.file.write(' in ')
                    self.gen_term_i(2, b)
                self.para(2, prec, gen)
            # case (TM.APP, [(TM.CONST, 'why3.HighOrd.HighOrd.infix_at', _), *args]):
            #     return self.gen_term_i(prec, (TM.APP, args))
            # case (TM.APP, [(TM.APP, [(TM.CONST, 'why3.HighOrd.HighOrd.infix_at', _), *args1]), *args2]):
            #     return self.gen_term_i(prec, (TM.APP, args1 + args2))
            # case (TM.APP, [(TM.CONST, 'map.Map.get', _), f, x]):
            #     return self.gen_term_i(prec, (TM.APP, [f, x]))
            case (TM.APP, [(TM.CONST, 'seq.Seq.singleton', ty), x]):
                if ty is not None:
                    self.file.write('(')
                self.file.write('[')
                self.gen_term_i(0, x)
                self.file.write(']')
                if ty is not None:
                    match ty:
                        case (TY.FUN, [_, ty]):
                            self.file.write(':')
                            self.gen_typ_i(0, ty)
                            self.file.write(')')
                        case _:
                            raise ValueError(f"gen_term_i: seq.Seq.singleton ty {ty}")
            case (TM.APP, [(TM.CONST, 'set.Set.singleton', ty), x]):
                #if ty is not None:
                #    self.file.write('(')
                self.file.write('({[')
                self.gen_term_i(0, x)
                self.file.write(']} : gset _)')
                # if ty is not None:
                #     self.file.write(':')
                #     self.gen_typ_i(0, ty)
                #     self.file.write(')')
            case (TM.APP, [(TM.CONST, 'set.Fset.add', ty), x, S]) if is_constant_set(S) is not None:
                eles = is_constant_set(term)
                self.file.write('({[')
                for i, e in enumerate(eles):
                    if i > 0:
                        self.file.write('; ')
                    self.gen_term_i(0, e)
                self.file.write(']} : gset _)')
            case (TM.APP, [(TM.CONST, 'bag.Bag.singleton', ty), x]):
                #if ty is not None:
                #    self.file.write('(')
                self.file.write('({[+')
                self.gen_term_i(0, x)
                self.file.write('+]} : gmultiset _)')
                #if ty is not None:
                #    self.file.write(':')
                #    self.gen_typ_i(0, ty)
                #    self.file.write(')')
            case (TM.APP, [(TM.CONST, 'set.Bag.add', ty), x, S]) if is_constant_set(S) is not None:
                eles = is_constant_set(term)
                self.file.write('({[+')
                for e in eles:
                    if i > 0:
                        self.file.write('; ')
                    self.gen_term_i(0, e)
                self.file.write('+]} : gmultiset _)')
            #case (TM.APP, [(TM.CONST, 'map.Map.set', _), ff, x, v]):
            #    kvs = [(x,v)]
            #    while True:
            #        match ff:
            #            case (TM.APP, [(TM.CONST, 'map.Map.set', _), f2, x, v]):
            #                kvs.append((x,v))
            #                ff = f2
            #            case _:
            #                break
            #    def gen():
            #        self.gen_term_i(1000, ff)
            #        self.file.write('(')
            #        for (i,(x,v)) in enumerate(kvs):
            #            if i > 0:
            #                self.file.write(', ')
            #            self.gen_term_i(0, x)
            #            self.file.write(' := ')
            #            self.gen_term_i(0, v)
            #        self.file.write(')')
            #    self.para(900, prec, gen)
            case (TM.APP, [(TM.CONST, 'list$set_i', _), l, i, v]) \
               | (TM.APP, [(TM.CONST, 'fmap.Fmap.add', _), i, v, l]):
                def gen():
                    self.file.write('<[')
                    self.gen_term_i(0, i)
                    self.file.write(' := ')
                    self.gen_term_i(0, v)
                    self.file.write(']>')
                self.para(195, prec, gen)
                self.gen_term_i(195, l)
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
                    self._in_pat == 0 and \
                    (name in ['∅', '⊤', 'Empty', 'Tree.tree.Empty', 'TreeRank.tree.E', 'what.Result', 'm2.mk',
                              'const', 'olift', 'subst_id_fo_term', 'olifts_symbol']\
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
                    self.file.write(' end')
                self.para(0, prec, gen)
            case (TM.PROD, children):
                self.file.write('(')
                clen = len(children)
                for (i,t) in enumerate(children):
                    if i > 0:
                        self.file.write(', ')
                        if i < clen - 1:
                            self.file.write('(')
                    self.gen_term_i(0, t)
                for _ in range(clen - 2):
                    self.file.write(')')
                self.file.write(')')
            case (TM.APP, [f, *args]):
                gen_app(f, args)
            case (TM.VAR, name, _):
                self.file.write(name)
            case (TM.NUM, val, ty):
                if '-' in val:
                    val = f"({val})"
                if ty:
                    match ty:
                        case (TY.TYPE, name, _, args):
                            name = self.atomT(name)
                            if name.startswith('bv'):
                                def gen():
                                    if name.startswith('bv'):
                                        self.file.write(f'{val}%bv')
                                    else:
                                        self.file.write(f'{val}%{name}')
                                    self.file.write(' : ')
                                    self.gen_typ_i(0, ty)
                                self.para(~1, prec, gen)
                            elif len(args) == 0:
                                self.file.write(f'{val}%{name}')
                            else:
                                raise ValueError(f"gen_term_i: num ty {ty}")
                        case _:
                            raise ValueError(f"gen_term_i: num ty {ty}")
                else:
                    self.file.write(val)
            case (TM.STRING, val):
                if any(ord(c) < 32 or ord(c) > 126 for c in val):
                    string = self.atom('$String')
                    code = self.atom('code$char')
                    for c in val:
                        self.file.write('(')
                        self.file.write(string)
                        self.file.write(' (')
                        self.file.write(code)
                        self.file.write(' ')
                        self.file.write(str(ord(c) % 256))
                        self.file.write('%nat)')
                    self.file.write(" ")
                    self.file.write(self.atom('$EmptyString'))
                    for c in val:
                        self.file.write(")")
                else:
                    self.file.write("\"")
                    self.file.write(val)
                    self.file.write("\"%string")
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
                self.file.write('(')
                self.gen_term_i(0, tm)
                self.file.write(' as ')
                self.file.write(name)
                self.file.write(')')
            case _ :
                raise ValueError(f"gen_term_i: {term}")

    def gen_instance(self, name, goal_name, params):
        suffix = goal_name.lower()
        axiom_name = f'{name}_{suffix}'
        self.file.write(f'Axiom {name}_{suffix} :')
        if len(params) > 0:
            self.file.write(' forall ')
        for p in params:
            self.file.write(' {' + f'{p} : Type' + '}')
            self.file.write(' `{Inhabited ' + p + '}')
            if self.needs_countable:
                self.file.write(" `{Countable " + p + "}")
        if len(params) > 0:
            self.file.write(',')
        self.file.write(f' {goal_name} ')
        if len(params) > 0:
            self.file.write('(')
            self.file.write(name)
            for i, p in enumerate(params):
                self.file.write(f' {p}')
            self.file.write(')')
        else:
            self.file.write(name)
        self.file.write(f'.\nGlobal Existing Instance {name}_{suffix}.\n')

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
        self.file.write(f"Axiom {name} :")
        for p in params:
            self.file.write(f' Type ->')
        self.file.write(' Type.\n')
        params = [tyvar_map(p.attrib['name']) for p in params]
        self.gen_instance(name, 'Inhabited', params)
        if len(params) == 0:
            self.gen_instance(name, 'Countable', [])
        #self.gen_instance(name, 'DecidableEq', params)
        self.decl_type(name, (name, self.namespace + '.' + name))
        #self.local_atom_mapping[name] = name

    def gen_param(self, param):
        name = self.name_of(param)
        if '.' in name:
            raise ValueError(f"gen_param: {name}")
        full_name = self.qualify(name)
        if full_name in self._atoms or full_name in self.binops:
            return
        if 'path' in param.attrib and param.attrib['path'] != self.working_module:
            raise ValueError(f"Param: {name}")
        self.decl_atom(name, (name, self.namespace + '.' + name))
        self.file.write(f"Axiom {name} : ")
        self.gen_typ_i_tvars(0, self.sexpr_type(param[0]))
        self.file.write(".\n")

    def _handle_missing_consts(self, bad_consts):
        for name, ty in bad_consts.items():
            if name in ['∅', 'inhabitant']:
                continue
            self.file.write(f"Axiom {name} : ")
            self.gen_typ_i_tvars(0, ty)
            self.file.write(".\n")
            self.decl_atom(name, (name, self.namespace + '.' + name))

    def gen_statement(self, assms, concls, pass_dummy = False, mode_forall = False, to_unfold_let = False):
        #if len(concls) > 1:
        #    raise ValueError(f"gen_statement: concls more than one")
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
        if len(tvs) == 0 and len(vars) == 0 and len(assms) == 0:
            mode_forall = False
        if mode_forall:
            self.file.write(' : forall ')
        for tv in tvs:
            self.file.write(" {" + tv + " : Type}")
        for tv in tvs:
            self.file.write(" `{Inhabited " + tv + "}")
            if self.needs_countable:
                self.file.write(" `{Countable " + tv + "}")
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
        if mode_forall:
            self.file.write(', ')
        else:
            self.file.write(' : ')
#        for (i,c) in enumerate(concls):
#            self.gen_term_i(0, c)
#        self.file.write('\n')
        if len(concls) > 1:
            prec = 121
        else:
            prec = 0
        for (i,c) in enumerate(concls):
            if i > 0:
                self.file.write(' ∧ ')
            if to_unfold_let:
                c = unfold_let(c)
            self.gen_term_i(prec, c)
    
    def gen_axiom(self, axiom):
        name = self.name_of(axiom)
        if '.' in name:
            raise ValueError(f"gen_axiom: {name}")
        self.decl_axiom(name, (name, self.namespace + '.' + name))
        assms, concl = self.check_statement(axiom)
        self.file.write(f"Axiom {name}")
        self.gen_statement(assms, concl, pass_dummy=True, mode_forall=True, to_unfold_let=True)
        self.file.write('.\n')

        # statements = self.split_statement(axiom)
        # for (i,s) in enumerate(statements):
        #     if i == 0:
        #         local_name = name
        #     else:
        #         local_name = name + '\'' + str(i)
        #     self.decl_axiom(local_name, (name, self.namespace + '.' + name))
        #     assms, concl = self.check_statement(s)
        #     self.file.write(f"Axiom {local_name}")
        #     self.gen_statement(assms, concl, pass_dummy=True, mode_forall=True)
        #     self.file.write('.\n')


    def gen_goal(self, goal):
        name = self.name_translation(goal.attrib['name'])
        full_name = self.qualify(name)
        if full_name in self.axioms:
            return
        assms, concl = self.check_statement(goal)
        self.file.write(f"Theorem {name}")
        self.gen_statement(assms, concl, pass_dummy=True)
        self.file.write('.\nAdmitted.\n')
        # statements = self.split_statement(goal)
        # for (i,s) in enumerate(statements):
        #     if i == 0:
        #         local_name = name
        #     else:
        #         local_name = name + '\'' + str(i)
        #     assms, concl = self.check_statement(s)
        #     self.file.write(f"Lemma {local_name}")
        #     self.gen_statement(assms, concl, pass_dummy=True)
        #     self.file.write('.\nAdmitted.\n')

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

        self.decl_atom(name, (name, self.namespace + '.' + name))
        self.file.write(f"Definition {name}")

        original_retty = retty
        if retty is None:
            retty = (TY.TYPE, '_', None, [])
        typ = (TY.FUN, argtys + [retty])
        self.fixed_vars[name] = typ

        tvs = {tyvar_map(tv) for tv in collect_tvars(typ)}
        for tv in tvs:
            self.file.write(" {" + tv + " : Type}")
        for tv in tvs:
            self.file.write(" `{Inhabited " + tv + "}")
            if self.needs_countable:
                self.file.write(" `{Countable " + tv + "}")
            #self.file.write(f" [DecidableEq {tv}]")
        for x, ty in args:
            self.file.write(f" ({x} : ")
            self.gen_typ_i(0, ty)
            self.file.write(')')

        if original_retty is not None:
            self.file.write(' : ')
            self.gen_typ_i(0, original_retty)
        self.file.write(" := ")
        self.gen_term_i(0, RHS)
        self.file.write(".\n")
        self.fixed_vars.clear()

    def gen_fun(self, fun, easy_mode=False):
        defs = self.parse_def(fun, bad_vname)
        for (name, _), _, _, _, _ in defs:
            if name in self.defs or name in self._atoms or name in self.binops:
                return
        for (name, _), _, _, _, _ in defs:
            if '.' in name:
                raise ValueError(f"gen_fun: {name}")

        is_mutual = len(defs) > 1
        def axiomatic():
            for (name, _),expr,_,argtys,retty in defs:
                self.file.write(f"Axiom {name} : ")
                if retty is None:
                    retty = (TY.TYPE, 'Prop', None, [])
                typ = (TY.FUN, argtys + [retty])
                self.gen_typ_i_tvars(0, typ)
                self.file.write(".\n")

            for (name, _),expr,_,argtys,retty in defs:
                self.file.write(f"Axiom {name}_def : forall")
                if retty is None:
                    retty = (TY.TYPE, 'Prop', None, [])
                tvs = {tyvar_map(tv) for tv in collect_tvars(typ)}
                for tv in tvs:
                    self.file.write(" {" + tv + " : Type}")
                for tv in tvs:
                    self.file.write(" `{Inhabited " + tv + "}")
                    if self.needs_countable:
                        self.file.write(" `{Countable " + tv + "}")
                (_, vars), _ = parse_EQ(expr)
                for v, ty in vars:
                    self.file.write(f" ({v} : ")
                    self.gen_typ_i(0, ty)
                    self.file.write(')')
                self.file.write(', ')
                self.fixed_vars[name] = typ
                self.decl_atom(name, (name, self.namespace + '.' + name))
                self.gen_term_i(0, expr)
                self.file.write(".\n")

        def program_fixpoint():
            for (name, _),expr,_,argtys,retty in defs:
                self.file.write(f"Program Fixpoint {name}")
                if retty is None:
                    retty = (TY.TYPE, 'Prop', None, [])
                typ = (TY.FUN, argtys + [retty])
                tvs = {tyvar_map(tv) for tv in collect_tvars(typ)}
                for tv in tvs:
                    self.file.write(" {" + tv + " : Type}")
                for tv in tvs:
                    self.file.write(" `{Inhabited " + tv + "}")
                    if self.needs_countable:
                        self.file.write(" `{Countable " + tv + "}")
                    #self.file.write(f" [DecidableEq {tv}]")
                (_, vars), RHS = parse_EQ(expr)
                for v, ty in vars:
                    self.file.write(f" ({v} : ")
                    self.gen_typ_i(0, ty)
                    self.file.write(')')
                self.file.write(' : ')
                typ = (TY.FUN, argtys[len(argtys):] + [retty])
                self.gen_typ_i(0, typ)
                self.file.write(' :=\n')

                self.fixed_vars[name] = typ
                self.decl_atom(name, (name, self.namespace + '.' + name))

                self.gen_term_i(0, RHS)
                self.file.write('.\nAdmit Obligations.\n')
        if easy_mode or is_mutual:
            axiomatic()
        else:
            program_fixpoint()


    def gen_datatype(self,datatype):
        # def is_inductive(datatype):
        #     def chk(dt):
        #         [constrs] = [x for x in dt if x.tag == 'constrs']
        #         return all(('name' not in c and all('name' not in a.attrib for a in c)) for c in constrs)
        #     return all(chk(dt) for dt in datatype)
        def gen_inductive(datatype):
            dlen = len(list(datatype))
            for di, dt in enumerate(datatype):
                [params] = [x for x in dt if x.tag == 'params']
                [constrs] = [x for x in dt if x.tag == 'constrs']
                params = [p.attrib['name'] for p in params]
                typ_name = dt.attrib['name']
                self.decl_type(typ_name, (typ_name, self.namespace + '.' + typ_name))
                if di == 0:
                    self.file.write(f"Inductive {typ_name}")
                else:
                    self.file.write(f"with {typ_name}")
                for param in params:
                    self.file.write(f' ({tyvar_map(param)} : Type)')
                self.file.write(' :=\n')
                target_typ = (TY.TYPE, typ_name, True,
                                [(TY.VAR, param) for param in params])
                clen = len(constrs)
                for ci, c in enumerate(constrs):
                    self.file.write('  | ')
                    cname = c.attrib['name']
                    self.decl_atom(cname, (cname, self.namespace + '.' + cname))
                    #self.local_atom_mapping[cname] = typ_name + '.' + cname
                    self.file.write(cname)
                    self.file.write(' : ')
                    self.gen_typ_i(0, (TY.FUN, [self.sexpr_type(a[0]) for a in c] + [target_typ]))
                    if ci == clen - 1 and di == dlen - 1:
                        self.file.write(f".\n")
                    else:
                        self.file.write('\n')
            for dt in datatype:
                [params] = [x for x in dt if x.tag == 'params']
                [constrs] = [x for x in dt if x.tag == 'constrs']
                params = [tyvar_map(p.attrib['name']) for p in params]
                typ_name = dt.attrib['name']
                self.gen_instance(typ_name, 'Inhabited', params)
                if len(params) == 0:
                    self.gen_instance(typ_name, 'Countable', [])
                if len(params) > 0:
                    for c in constrs:
                        cname = c.attrib['name']
                        self.file.write(f"Arguments {cname}")
                        for param in params:
                            self.file.write(' {' + param + '}')
                        self.file.write('.\n')
                #self.gen_instance(typ_name, 'DecidableEq', params)
            for dt in datatype:
                [params] = [x for x in dt if x.tag == 'params']
                [constrs] = [x for x in dt if x.tag == 'constrs']
                params = [tyvar_map(p.attrib['name']) for p in params]
                typ_name = dt.attrib['name']

                cn = len(constrs)
                for ci, c in enumerate(constrs):
                    cname = c.attrib['name']
                    for ai, a in enumerate(c):
                        if 'name' in a.attrib:
                            name = a.attrib['name']
                            self.decl_atom(name, (name, self.namespace + '.' + name))
                            self.file.write(f"Definition {name}")
                            for param in params:
                                self.file.write(' {' + param + ' : Type}')
                                if cn > 1:
                                    self.file.write(' `{Inhabited ' + param + '}')
                            self.file.write(f" (x : {typ_name}")
                            for param in params:
                                self.file.write(f' {param}')
                            self.file.write(') := match x with | ')
                            self.file.write(f' {cname} ')
                            for i in range(len(c)):
                                if i == ai:
                                    self.file.write(f'a ')
                                else:
                                    self.file.write(f'_ ')
                            self.file.write('=> a')
                            if cn > 1:
                                self.file.write(f' | _ => inhabitant')
                            self.file.write(' end.\n')

        #def is_structure(datatype):
        #    if len(datatype) != 1:
        #        return False
        #    dt = datatype[0]
        #    [constrs] = [x for x in dt if x.tag == 'constrs']
        #    return len(constrs) == 1 and\
        #        all('name' in a.attrib for a in constrs[0])
        #        #constrs[0].attrib['name'] == dt.attrib['name'] and\
        
        #def gen_structure(datatype):
        #    dt = datatype[0]
        #    [params] = [x for x in dt if x.tag == 'params']
        #    [constrs] = [x for x in dt if x.tag == 'constrs']
        #    typ_name = dt.attrib['name']
        #    self.decl_type(typ_name, (typ_name, self.namespace + '.' + typ_name))
        #    params = [tyvar_map(p.attrib['name']) for p in params]
        #    self.file.write(f"Record {typ_name}")
        #    for param in params:
        #        self.file.write(f' ({param} : Type)')
        #    self.file.write(' :={\n')
        #    constr = constrs[0]
        #    #self.decl_atom(typ_name, (self.namespace + '.' + typ_name,))
        #    cname = constr.attrib['name']
        #    self.decl_atom(cname, (cname, typ_name + '.mk', self.namespace + '.' + typ_name + '.mk'))
        #    #self.local_atom_mapping[cname] = typ_name + '.mk'
        #    clen = len(constr)
        #    for ci, a in enumerate(constr):
        #        self.file.write('  ')
        #        aname = a.attrib['name']
        #        self.file.write(aname)
        #        self.decl_atom(aname, (aname, typ_name + '.' + aname, self.namespace + '.' + typ_name + '.' + aname))
        #        #self.local_atom_mapping[aname] = typ_name + '.' + aname
        #        self.file.write(' : ')
        #        self.gen_typ_i(0, self.sexpr_type(a[0]))
        #        if ci < clen - 1:
        #            self.file.write(';')
        #        self.file.write('\n')
        #    self.file.write('}.\n')
        #    self.gen_instance(typ_name, 'Inhabited', params)
        #    if len(params) == 0:
        #        self.gen_instance(typ_name, 'Countable', [])
        #    #self.gen_instance(typ_name, 'DecidableEq', params)

        gen_inductive(datatype)

        # if is_inductive(datatype):
        #     gen_inductive(datatype)
        # elif is_structure(datatype):
        #     gen_structure(datatype)
        # else:
        #     raise ValueError(f"gen_datatype: {datatype}")

    def gen_inductive(self, xml):
        sections = [(self.name_of(x), x) for x in xml]
        for (name, _) in sections:
            if '.' in name:
                raise ValueError(f"gen_inductive: {name}")
            full_name = self.qualify(name)
            if full_name in self.defs or full_name in self._atoms or full_name in self.binops:
                return

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

        splen = len(prems_conclss)
        for si, ((name, body), prems_concls) in enumerate(zip(sections, prems_conclss)):
            if si == 0:
                self.file.write(f"Inductive {name}")
            else:
                self.file.write(f"with {name}")
            typ = self.sexpr_type(body[0])
            tvs = collect_tvars(typ)
            tvs = {tyvar_map(tv) for tv in tvs}
            for tv in tvs:
                self.file.write(" {" + f" {tv} : Type" + "}")
            self.file.write(' : ')
            self.gen_typ_i(0, typ)
            self.file.write(' :=\n')
            pc_len = len(prems_concls)
            for pci, (rule_name, prems, concl) in enumerate(prems_concls):
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
                    self.gen_term_i(102, expr)
                    self.file.write(" -> ")
                self.gen_term_i(101, concl)
                if pci != pc_len - 1 or si != splen - 1:
                    self.file.write('\n')
                else:
                    self.file.write('.\n')
            self.decl_atom(name, (name, self.namespace + '.' + name))

    def generate(self, xml, gen_goal, namespace=None, easy_mode=False):
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
            for y in x:
                if y.tag == 'require':
                    name = y.attrib['name']
                    if name.startswith('set.Fset') or name in ['bag.Bag']:
                        self.needs_countable = True
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
        self.file.write("""From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
""")
        for imp in imports:
            self.file.write(f"Require Import {imp}.\n")
        self.file.write(f"Open Scope Z_scope.\n")
        #self.file.write(f"open Classical\n")
        #self.file.write(f"open Lean4Why3\n")
        #self.file.write(f"namespace {namespace}\n")

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
                    self.gen_fun(x, easy_mode)
                case 'inductive':
                    self.gen_inductive(x)
                case _:
                    raise ValueError(f"Unknown XML node {x}")
            self.reset_free_bound_contextual_vars()
        #self.file.write(f"end {namespace}\n")
        theories = set()
        for imp in imports:
            if imp.startswith('Why3.matrix'):
                pass
            theories.add('.'.join(imp.split('.')[:-1]))
        return theories

    @staticmethod
    def mk_dune(output_dir, dune_name, theories, package_name=None):
        dune_file = os.path.join(output_dir, 'dune')
        theories_file = os.path.join(output_dir, 'theories.lst')
        if os.path.exists(theories_file):
            with open(theories_file, 'r') as f:
                existing_theories = [line.strip() for line in f.readlines()]
        else:
            existing_theories = []
        if all(t in existing_theories for t in theories):
            return
        with open(theories_file, 'a') as f:
            for t in theories:
                if t == 'Why3.matrix':
                    pass
                if t not in existing_theories:
                    existing_theories.append(t)
                    f.write(t)
                    f.write('\n')
        if package_name is None:
            if 'generation/rocq/Why3' in output_dir:
                package_name = "Why3Bench"
            else:
                package_name = "Why3Bench-" + Rocq_Exporter.benchmark_cat_of(output_dir)
        os.makedirs(output_dir, exist_ok=True)
        if 'Why3.array' in existing_theories:
            pass
        with open(dune_file, 'w') as f:
            f.write(f"""(coq.theory
(package {package_name})
(name {dune_name})
(theories {' '.join(existing_theories)}))
""")

    @classmethod
    def realize_impl(cls, module_name, mlw_path, xml, statistics=None):
        if mlw_path is None:
            # system library
            output_dir = "./generation/rocq/Why3/" + '/'.join(module_name.split('.')[:-1])
            full_name = "Why3." + module_name
            full_name = full_name.translate(THY_NAME_TRANSLATION)
        else:
            output_dir = os.path.join(cls.lib_dir_of(mlw_path), *module_name.split('.')[:-1])
            full_name = module_name.translate(THY_NAME_TRANSLATION)
            if Exporter.is_single_file(mlw_path):
                full_name = os.path.splitext(os.path.basename(mlw_path))[0] + '_vcg.' + full_name
            else:
                full_name = mlw_path.split('/')[-2] + '.' + full_name
            #full_name += '.' + module_name.split('.')[-1]

        parts = full_name.split('.')
        def norm(part):
            if part and not part[0].isalpha():
                part = 'X' + part
            return part
        full_name = '.'.join(map(norm, parts))

        os.makedirs(output_dir, exist_ok=True)
        short_name = full_name.split('.')[-1]
        dune_name = '.'.join(full_name.split('.')[:-1])

        thy_file = os.path.join(output_dir, short_name + '.v')
        logger.info(f"Generating the dependency {thy_file}")
        if os.path.exists(thy_file) and not os.access(thy_file, os.W_OK):
            logger.info(f"{thy_file} exists and is not writable, skipping...")
        else:
            with open(thy_file, 'w') as f:
                exporter = Rocq_Exporter(f, module_name, mlw_path, short_name, statistics=statistics)
                if exporter.qualifiers is None:
                    #TODO: BUG???
                    exporter.qualifiers = ["_".join(module_name.split('.')[:-2])]
                theories = exporter.generate(xml, False, short_name)
                if dune_name in theories:
                    theories.remove(dune_name)
            Rocq_Exporter.mk_dune(output_dir, dune_name, theories)
            ret = syntax_check(thy_file, print=False)
            if not ret:
                with open(thy_file, 'w') as f:
                    exporter = Rocq_Exporter(f, module_name, mlw_path, short_name, statistics=statistics)
                    if exporter.qualifiers is None:
                        #TODO: BUG???
                        exporter.qualifiers = ["_".join(module_name.split('.')[:-2])]
                    exporter.generate(xml, False, short_name, easy_mode=True)
                ret = syntax_check(thy_file)
                if not ret:
                    raise ValueError(f"Failed to generate {thy_file}")

        return exporter.dump_module(module_name, full_name)

    @staticmethod
    def benchmark_cat_dir_of(path):
        return Exporter.benchmark_cat_dir_of(path)
    @staticmethod
    def benchmark_cat_of(path):
        return Exporter.benchmark_cat_of(path)

    @classmethod
    def VCG_impl(cls, mlw_path, xml, xml_path, statistics=None):
        output_dir = os.path.dirname(xml_path)
        short_name = os.path.splitext(os.path.basename(xml_path))[0]
        dune_name = os.path.splitext(os.path.relpath(mlw_path, Rocq_Exporter.benchmark_cat_dir_of(mlw_path)))[0].replace('/', '.') + '_vcg'
        full_name = dune_name + '.' + short_name
        
        parts = full_name.split('.')
        def norm(part):
            if part and not part[0].isalpha():
                part = 'X' + part
            return part
        full_name = '.'.join(map(norm, parts))
        short_name = full_name.split('.')[-1]
        dune_name = '.'.join(full_name.split('.')[:-1])

        path = os.path.join(output_dir, short_name + '.v')
        logger.info(f"Generating the VC {path}")

        if os.path.exists(path) and not os.access(path, os.W_OK):
            logger.info(f"{path} exists and is not writable, skipping VCG...")
            return True
        with open(path, 'w') as file:
            exporter = cls(file, 'VCG_endpoint', mlw_path, short_name, statistics=statistics)
            theories = exporter.generate(xml, True, short_name)
            if dune_name in theories:
                theories.remove(dune_name)
        Rocq_Exporter.mk_dune(output_dir, dune_name, theories)
        ret = syntax_check(path, print=False)
        if not ret:
            with open(path, 'w') as file:
                exporter = cls(file, 'VCG_endpoint', mlw_path, short_name, statistics=statistics)
                exporter.generate(xml, True, short_name, easy_mode=True)
            ret = syntax_check(path)
        return ret

PRINTERS['rocq'] = Rocq_Exporter

def syntax_check(file, print=True):
    try:
        cat_dir = Rocq_Exporter.benchmark_cat_dir_of(file)
        file = os.path.relpath(file, cat_dir)
        logger.info(f"Syntax checking {file} from {cat_dir}")
        result = subprocess.run(['dune', 'build', file + 'o'], 
                              capture_output=True, text=True, timeout=30, cwd=cat_dir)
        if print:
            if result.returncode == 0:
                logger.info(f"Syntax check passed for {file}")
            else:
                logger.error(f"Syntax check failed for {file}:\n{result.stderr}")
        return result.returncode == 0
    except subprocess.TimeoutExpired:
        if print:
            logger.error(f"Syntax check timed out for {file}")
        return True
    except Exception as e:
        if print:
            logger.error(f"Syntax check error for {file}: {e}")
        return False
