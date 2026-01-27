#!/bin/env python3
from .base import *
import threading
import time

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
    '.': '_', '-': '_'
})

KEYWORDS = {'choose'}
QUOTE_KWD = {'value', 'context', 'termination', 'next', 'values', 'text', 'back', 'term', 'from', 'datatype', 'is'}
CONST_NAMES = {'hd', 'tl', 'sum', 'sum\'', 'min', 'max', 'top', 'id', 'inv'}

locker = threading.RLock()

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

class Isabelle_Exporter(Exporter):
    def __init__(self, file, working_module, working_mlw_file, easy_mode = False, statistics=None, session=None):
        super().__init__(file, 'isabelle', working_module, working_mlw_file, statistics=statistics)
        #self.default_num_typ = 'why3.BuiltIn.BuiltIn.int'
        self.thy_name = None
        self.session = session
        self.fixed_vars = {}
        self.easy_mode = easy_mode
        self._in_pat = 0

    @classmethod
    def language(cls):
        return 'isabelle'

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
                            self.file.write(' \\<Rightarrow> ')
                        if i == len(args) - 1:
                            self.gen_typ_i(2, t)
                        else:
                            self.gen_typ_i(3, t)
                self.para(2, prec, gen)
            case (TY.TYPE, name, local, children) if name in self.types and self.types[name] != name:
                self.gen_typ_i(prec, (TY.TYPE, self.types[name], local, children))
            case (TY.TYPE, name, _, []):
                self.file.write(name)
            case (TY.TYPE, name, _, [t]):
                def gen():
                    self.gen_typ_i(1000, t)
                    self.file.write(' ')
                    self.file.write(name)
                self.para(1000, prec, gen)
            case (TY.TYPE, name, _, children) :
                def gen():
                    self.file.write('(')
                    for (i,t) in enumerate(children):
                        if i > 0:
                            self.file.write(', ')
                        self.gen_typ_i(0, t)
                    self.file.write(') ')
                    self.file.write(name)
                self.para(1000, prec, gen)
            case (TY.VAR, name):
                self.file.write("'")
                self.file.write(name)
            case (TY.PRODT, []):
                self.file.write('unit')
            case (TY.PRODT, children):
                def gen():
                    for (i,t) in enumerate(children):
                        if i > 0:
                            self.file.write(' \\<times> ')
                        self.gen_typ_i(21, t)
                self.para(20, prec, gen)
            case _ :
                raise ValueError(f"Unknown type: {typ}")

    def gen_params(self, params):
        match list(params):
            case []:
                pass
            case [p]:
                self.file.write("'")
                self.file.write(p.attrib['name'])
            case _:
                self.file.write('(')
                for (i,p) in enumerate(params):
                    if i > 0:
                        self.file.write(', ')
                    self.file.write("'")
                    self.file.write(p.attrib['name'])
                self.file.write(')')

    def gen_typedecl(self, typ):
        name = self.name_of(typ)
        if '.' in name:
            raise ValueError(f"Typedecl: {name}")
        if name in ['word']:
            return
        full_name = self.qualify(name)
        if full_name in self.types:
            return
        self.file.write(f"typedecl ")
        [params] = [x for x in typ if x.tag == 'params']
        self.gen_params(params)
        self.file.write(' ')
        self.file.write(quote(name))
        self.file.write('\n')
        self.decl_type(name, (name, self.thy_name + '.' + name))


    def gen_param(self, param):
        name = self.name_of(param)
        if '.' in name:
            raise ValueError(f"gen_param: {name}")
        full_name = self.qualify(name)
        if full_name in self._atoms or full_name in self.binops:
            return
        if 'path' in param.attrib and param.attrib['path'] != self.working_module:
            raise ValueError(f"Param: {name}")
        self.decl_atom(name, (name, self.thy_name + '.' + name))
        self.file.write(f"consts {quote(name)} :: \"")
        self.gen_typ(0, param[0])
        self.file.write("\"\n")

    def _handle_missing_consts(self, bad_consts):
        for name, ty in bad_consts.items():
            self.file.write(f"consts {quote(name)} :: \"")
            self.gen_typ_i(0, ty)
            self.file.write("\"\n")
            self.decl_atom(name, (name, self.thy_name + '.' + name))

    def gen_term_i(self, prec, term):
        def gen_app(f, args):
            def gen():
                self.gen_term_i(999, f)
                for a in args:
                    self.file.write(' ')
                    self.gen_term_i(1000, a)
            self.para(999, prec, gen)

        match term:
            case (TM.APP, [x]):
                return self.gen_term_i(prec, x)
            # case (TM.APP, [(TM.CONST, 'string.Char.contents', ty), x]):
            #     return self.gen_term_i(prec, (TM.APP, [(TM.CONST, 'seq.Seq.singleton', ty), x]))
            # case (TM.APP, [(TM.CONST, 'string.String.contains', ty), a, b]):
            #     return (TM.APP, [(TM.CONST, '$contains', ty), b, a])
            case (TM.APP, [(TM.CONST, 'why3.HighOrd.HighOrd.infix_at', _), *args]):
                return self.gen_term_i(prec, (TM.APP, args))
            case (TM.APP, [(TM.APP, [(TM.CONST, 'why3.HighOrd.HighOrd.infix_at', _), *args1]), *args2]):
                return self.gen_term_i(prec, (TM.APP, args1 + args2))
            case (TM.APP, [(TM.CONST, 'map.Map.get', _), f, x]):
                return self.gen_term_i(prec, (TM.APP, [f, x]))

            case (TM.APP, [(TM.CONST, 'HOL.Let', _), v, (TM.ABS, x, t, b)]):
                assigns = [(x, t, v)]
                def collect(b):
                    match b:
                        case (TM.APP, [(TM.CONST, 'HOL.Let', _), v, (TM.ABS, x, t, b)]):
                            assigns.append((x, t, v))
                            return collect(b)
                        case _:
                            return b
                b = collect(b)
                def gen():
                    self.file.write('let ')
                    for (i, (x, t, v)) in enumerate(    assigns):
                        if i > 0:
                            self.file.write('; ')
                        if t is not None:
                            self.file.write(f"{x} :: ")
                            self.gen_typ_i(0, t)
                        else:
                            self.file.write(x)
                        self.file.write(' = ')
                        self.gen_term_i(0, v)
                    self.file.write(' in ')
                    self.gen_term_i(10, b)
                self.para(10, prec, gen)
            case (TM.APP, [(TM.CONST, 'HOL.If', _), c, a, b]):
                def gen():
                    self.file.write('if ')
                    self.gen_term_i(0, c)
                    self.file.write(' then ')
                    self.gen_term_i(0, a)
                    self.file.write(' else ')
                    self.gen_term_i(10, b)
                self.para(10, prec, gen)
            # case (TM.CONST, 'list.Nth.nth', ty):
            #     return self.gen_term_i(prec, (TM.CONST, '$nth', ty))
            # case (TM.CONST, 'list.NthNoOpt.nth', ty):
            #     return self.gen_term_i(prec, (TM.CONST, '$nth', ty))
            case (TM.APP, [(TM.CONST, 'set.Set.singleton', ty), x]):
                self.file.write('{')
                self.gen_term_i(0, x)
                self.file.write('}')
            case (TM.APP, [(TM.CONST, 'bag.Bag.singleton', ty), x]):
                self.file.write('{#')
                self.gen_term_i(0, x)
                self.file.write('#}')
            # case (TM.APP, [(TM.CONST, 'list.Nth.nth', ty), a, b]):
            #     return self.gen_term_i(prec, (TM.APP, [(TM.CONST, 'nth_opt$i', ty), b, a]))
            # case (TM.APP, [(TM.CONST, 'list.NthNoOpt.nth', ty), a, b]):
            #     return self.gen_term_i(prec, (TM.APP, [(TM.CONST, 'nth$i', ty), b, a]))
            case (TM.APP, [(TM.CONST, 'map.Map.set', _), ff, x, v]):
                kvs = [(x,v)]
                while True:
                    match ff:
                        case (TM.APP, [(TM.CONST, 'map.Map.set', _), f2, x, v]):
                            kvs.append((x,v))
                            ff = f2
                        case _:
                            break
                def gen():
                    self.gen_term_i(1000, ff)
                    self.file.write('(')
                    for (i,(x,v)) in enumerate(kvs):
                        if i > 0:
                            self.file.write(', ')
                        self.gen_term_i(0, x)
                        self.file.write(' := ')
                        self.gen_term_i(0, v)
                    self.file.write(')')
                self.para(900, prec, gen)
            # case (TM.APP, [(TM.CONST, 'seq.Seq.snoc', _), l, x]):
            #     return self.gen_term_i(prec, (TM.APP, [
            #         (TM.CONST, 'seq.Seq.infix_plpl', None), l, (TM.APP, [(TM.CONST, 'seq.Seq.singleton', None), x])]))
            case (TM.APP, [(TM.CONST, 'seq.Seq.singleton', _), x]):
                self.file.write('[')
                self.gen_term_i(0, x)
                self.file.write(']')
            # case (TM.APP, [(TM.CONST, 'seq.Seq.mixfix_lb_..rb', ty), l, i]):
            #     return self.gen_term_i(prec, (TM.APP, [(TM.CONST, '$.drop', ty), i, l]))
            # case (TM.APP, [(TM.CONST, 'seq.Seq.mixfix_lb.._rb', ty), l, i]):
            #     return self.gen_term_i(prec, (TM.APP, [(TM.CONST, '$.take', ty), i, l]))
            # case (TM.APP, [(TM.CONST, 'list.Mem.mem', _), x, l]) \
            #    | (TM.APP, [(TM.CONST, 'seq.Mem.mem', _), x, l]):
            #     self.gen_term_i(prec, (TM.APP, [(TM.CONST, 'Set.member', None), x, (TM.APP, [(TM.CONST, 'List.set', None), l])]))
            case (TM.APP, [(TM.CONST, 'array.Array.mixfix_lblsmnrb', _), l, i, v]) \
               | (TM.APP, [(TM.CONST, 'seq.Seq.set', _), l, i, v]) \
               | (TM.APP, [(TM.CONST, 'seq.Seq.mixfix_lblsmnrb', _), l, i, v]):
                ivs = [(i,v)]
                while True:
                    match l:
                        case (TM.APP, [(TM.CONST, 'array.Array.mixfix_lblsmnrb', _), l2, i2, v2]) \
                           | (TM.APP, [(TM.CONST, 'seq.Seq.set', _), l2, i2, v2]) \
                           | (TM.APP, [(TM.CONST, 'seq.Seq.mixfix_lblsmnrb', _), l2, i2, v2]):
                            ivs.append((i2,v2))
                            l = l2
                        case _:
                            break
                def gen():
                    self.gen_term_i(1000, l)
                    self.file.write('[')
                    for (j,(n,v)) in enumerate(ivs):
                        if j > 0:
                            self.file.write(', ')
                        self.file.write(self._atoms['$.nat'])
                        self.file.write(' ')
                        self.gen_term_i(1000, n)
                        self.file.write(' := ')
                        self.gen_term_i(0, v)
                    self.file.write(']')
                self.para(900, prec, gen)
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
                        self.file.write(' :: ')
                        self.gen_typ_i(0, t)
                        self.file.write(')')
                    self.file.write('. ')
                    self.gen_term_i(prec_b, body)
                self.para(prec_b, prec, gen)
            case (TM.CONST, name, ty):
                if name == 'div':
                    name = self.thy_name + '.' + name
                    self.file.write(name)
                else:
                    name = self.atom(name)
                    if ty is not None and \
                        (name in ['Empty'] \
                        or (name in ['E', 'Result', 'm\'mk1', 'const', 'olift', 'subst_id_fo_term', 'olifts_symbol', 'Nil'] and self._in_pat == 0)\
                        or has_tvar(ty) and ty[0] != TY.FUN):
                        self.file.write(f'({name} :: ')
                        self.gen_typ_i(0, ty)
                        self.file.write(')')
                    else:
                        name = self.atom(name)
                        self.file.write(name)
            case (TM.CASE, tm, pats):
                def gen():
                    self.file.write('case ')
                    self.gen_term_i(0, tm)
                    self.file.write(' of ')
                    for (i,(p,_,r)) in enumerate(pats):
                        if i > 0:
                            self.file.write(' | ')
                        (p2, r) = pattern_as_to_let(p, r, CONST_NAMES)
                        self._in_pat += 1
                        self.gen_term_i(11, p2)
                        self._in_pat -= 1
                        self.file.write(' \\<Rightarrow> ')
                        self.gen_term_i(11, r)
                self.para(1, prec, gen)
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
                match ty:
                    case (TY.TYPE, name, _, _) if False: #name == self.default_num_typ:
                        self.file.write(val)
                    case _:
                        def gen():
                            self.file.write(val)
                            if ty:
                                self.file.write(' :: ')
                                self.gen_typ_i(0, ty)
                        self.para(3, prec, gen)
            case (TM.STRING, val):
                if any(ord(c) < 32 or ord(c) > 126 for c in val):
                    self.file.write("[")
                    for i, c in enumerate(val):
                        if i > 0:
                            self.file.write(", ")
                        x = ord(c) % 256
                        self.file.write(f"CHR 0x{x:X}")
                    self.file.write("]")
                else:
                    self.file.write("''")
                    self.file.write(val)
                    self.file.write("''")
            case (TM.ABS, vname, typ, body):
                def gen():
                    if typ is None:
                        self.file.write('\\<lambda> ')
                        self.file.write(vname)
                        self.file.write('. ')
                        self.gen_term_i(3, body)
                    else:
                        self.file.write('\\<lambda> (')
                        self.file.write(vname)
                        self.file.write(' :: ')
                        self.gen_typ_i(0, typ)
                        self.file.write('). ')
                        self.gen_term_i(3, body)
                self.para(3, prec, gen)
            case (TM.AS, _, _):
                raise ValueError(f"BUG: `as` shouldn't occur here")
            case _ :
                raise ValueError(f"gen_term_i: {term}")

    def gen_statement(self, assms, concls, long = False, pass_dummy = False, to_unfold_let = False):
        vars = {}
        for a in assms:
            collect_vars(a, vars)
            self.decl_free_bound_contextual_vars(a)
        if pass_dummy:
            concls = [subst_dummy(c) for c in concls]
        for c in concls:
            collect_vars(c, vars)
            self.decl_free_bound_contextual_vars(c)
        if long:
            if vars:
                for (k,v) in vars.items():
                    self.file.write(f"  fixes {quote(k)} :: \"")
                    self.gen_typ_i(0, v)
                    self.file.write('\"\n')
            if len(assms) > 0:
                for (i,a) in enumerate(assms):
                    self.file.write(f"  assumes fact{i}: \"")
                    if to_unfold_let:
                        a = unfold_let(a)
                    self.gen_term_i(0, a)
                    self.file.write('\"\n')
            if vars or len(concls) > 0:
                self.file.write('  shows ')
        else:
            self.file.write('  ')
        for (i,c) in enumerate(concls):
            if i > 0:
                self.file.write('  and ')
            self.file.write('\"')
            if to_unfold_let:
                c = unfold_let(c)
            self.gen_term_i(0, c)
            self.file.write('\"\n')
        if len(assms) > 0 and not long:
            self.file.write(' if ')
            for (i,a) in enumerate(assms):
                if i > 0:
                    self.file.write(' and ')
                if to_unfold_let:
                    a = unfold_let(a)
                self.file.write('\"')
                self.gen_term_i(0, a)
                self.file.write('\"\n')
        if not long:
            for (i, (k,v)) in enumerate(vars.items()):
                if i == 0:
                    self.file.write(f"  for {quote(k)} :: \"")
                else:
                    self.file.write(f"  and {quote(k)} :: \"")
                self.gen_typ_i(0, v)
                self.file.write('\"\n')

    def gen_axiom(self, axiom):
        name = self.name_of(axiom)
        if '.' in name:
            raise ValueError(f"gen_axiom: {name}")
        statements = self.split_statement(axiom)
        if len(statements) > 1:
            for (i,s) in enumerate(statements):
                xname = name + '\'' + str(i)
                self.decl_axiom(xname, self.thy_name + '.' + xname)
                assms, concl = self.check_statement(s)
                self.file.write(f"axiomatization where {quote(xname)}: ")
                self.gen_statement(assms, concl, pass_dummy=True, to_unfold_let=True)
        else:
            self.decl_axiom(name, self.thy_name + '.' + name)
            assms, concl = self.check_statement(axiom)
            self.file.write(f"axiomatization where {quote(name)}: ")
            self.gen_statement(assms, concl, pass_dummy=True, to_unfold_let=True)

    def gen_goal(self, goal):
        #if 'altname' in goal.attrib:
        #    name = self.name_translation(goal.attrib['altname'])
        #else:
        name = self.name_translation(goal.attrib['name'])
        full_name = self.qualify(name)
        if full_name in self.axioms:
            return
        assms, concls = self.check_statement(goal)
        self.file.write(f"theorem {quote(name)}:\n")
        self.gen_statement(assms, concls, True, pass_dummy=True)
        self.file.write('  sorry\n')
        if self.statistics is not None: # and self.working_mlw_file_rel:
            #key = f"{self.working_mlw_file_rel}:{self.thy_name}"
            key = os.path.relpath(self.file.name, BASE_DIR)
            self.statistics[f"{key}:size"] = sum(size_of_term(assm) for assm in assms) + sum(size_of_term(concl) for concl in concls)
            quant_alt_values = [quantifier_alternation(assm) for assm in assms] + [quantifier_alternation(concl) for concl in concls]
            self.statistics[f"{key}:quant_alt"] = max(quant_alt_values) if quant_alt_values else 0
            depth_values = [depth_of_term(assm) for assm in assms] + [depth_of_term(concl) for concl in concls]
            self.statistics[f"{key}:depth"] = max(depth_values) if depth_values else 0
            symbls = set()
            for assm in assms:
                unique_symbols_of(assm, symbls)
            for concl in concls:
                unique_symbols_of(concl, symbls)
            self.statistics[f"{key}:unique_symbols"] = len(symbls)
            deps = set()
            for assm in assms:
                constant_dependencies_of(assm, deps)
            for concl in concls:
                constant_dependencies_of(concl, deps)
            self.statistics[f"{key}:constant_dependencies"] = list(deps)
            self.statistics.commit()

    def gen_def(self, defi):
        name = self.name_of(defi)
        if name.startswith('infix'):
            pass
        if '.' in name:
            raise ValueError(f"gen_def: {name}")
        full_name = self.qualify(name)
        if full_name in self.defs or full_name in self._atoms or full_name in self.binops:
            return
        [((name, args), expr, _, argtys, retty)] = self.parse_def([defi], bad_vname)

        self.decl_atom(name, (name, self.thy_name + '.' + name))
        self.file.write(f"definition {quote(name)} :: \"")
        if retty is None:
            retty = (TY.TYPE, '_', None, [])
        typ = (TY.FUN, argtys + [retty])
        self.fixed_vars[name] = typ
        self.gen_typ_i(0, typ)
        self.file.write("\"\n  where \"")
        self.gen_term_i(0, expr)
        self.file.write("\"")
        if args:
            self.file.write(" for")
            for x, _ in args:
                self.file.write(" ")
                self.file.write(quote(x))
        self.file.write("\n")
        self.fixed_vars.clear()
        if self.statistics is not None:
            deps = set()
            constant_dependencies_of(expr, deps)
            full_name = self.pretty_qualify(name)
            key = f"const${os.path.relpath(self.file.name, BASE_DIR)}${full_name}"
            self.statistics[key] = list(deps)
            self.statistics.commit()

    def gen_fun(self, fun):
        defs = self.parse_def(fun, bad_vname)
        for (name, _), _, _, _, _ in defs:
            if name in self.defs or name in self._atoms or name in self.binops:
                return
        for (name, _), _, _, _, _ in defs:
            if '.' in name:
                raise ValueError(f"gen_fun: {name}")
        if self.easy_mode:
            self.file.write('function ')
        else:
            self.file.write('fun ')
        # for (_,expr,_,_) in defs:
        #     self.check_all_consts_declared(expr)
        for (i,((name, _),expr,_,argtys,retty)) in enumerate(defs):
            # self.decl_free_bound_contextual_vars(expr)
            if retty is None:
                retty = (TY.TYPE, '_', None, [])
            typ = (TY.FUN, argtys + [retty])
            self.fixed_vars[name] = typ
            self.decl_atom(name, (name, self.thy_name + '.' + name))
            if i > 0:
                self.file.write('  and ')
            self.file.write(quote(name))
            self.file.write(" :: \"")
            self.gen_typ_i(0, typ)
            self.file.write("\"")
        self.file.write("\n  where ")
        for (i,((_, args),expr,_,_,_)) in enumerate(defs):
            for k, (vars, head, LHS, RHS) in enumerate(self.eq_match_2_branches(expr)):
                if i + k > 0:
                    self.file.write('      | ')
                LHS = (TM.APP, [head, *LHS])
                eq = (TM.APP, [(TM.CONST, '$eq', None), LHS, RHS])
                self.file.write("\"")
                self.gen_term_i(0, eq)
                self.file.write("\"")
                if vars:
                    self.file.write(" for")
                    for x in vars:
                        self.file.write(" ")
                        self.file.write(quote(x))
                self.file.write("\n")
        self.fixed_vars.clear()
        if self.easy_mode:
            self.file.write('  sorry\ntermination sorry\n')
        if self.statistics is not None:
            for (_,((name, _),expr,_,_,_)) in enumerate(defs):
                deps = set()
                constant_dependencies_of(expr, deps)
                full_name = self.pretty_qualify(name)
                key = f"const${os.path.relpath(self.file.name, BASE_DIR)}${full_name}"
                self.statistics[key] = list(deps)
                self.statistics.commit()
    
    def gen_datatype(self,datatype):
        self.file.write('datatype ')
        for (i,dt) in enumerate(datatype):
            if i > 0:
                self.file.write('     and ')
            [params] = [x for x in dt if x.tag == 'params']
            [constrs] = [x for x in dt if x.tag == 'constrs']
            self.gen_params(params)
            self.file.write(' ')
            typ_name = dt.attrib['name']
            self.file.write(quote(typ_name))
            self.file.write(' = ')
            self.decl_type(typ_name, (typ_name, self.thy_name + '.' + typ_name))
            for (i,c) in enumerate(constrs):
                if i > 0:
                    self.file.write(' | ')
                cname = c.attrib['name']
                self.decl_atom(cname, (cname, self.thy_name + '.' + cname, self.thy_name + '.' + typ_name + '.' + cname))
                self.file.write(quote(cname))
                for (i,a) in enumerate(c):
                    self.file.write(' ')
                    if 'name' in a.attrib:
                        aname = a.attrib['name']
                        self.decl_atom(aname, (aname, self.thy_name + '.' + aname, self.thy_name + '.' + typ_name + '.' + aname))
                        self.file.write('(')
                        self.file.write(quote(aname))
                        self.file.write(': ')
                    self.file.write('\"')
                    self.gen_typ(0, a[0])
                    self.file.write('\"')
                    if 'name' in a.attrib:
                        self.file.write(')')
            self.file.write('\n')
    
    def gen_inductive(self, xml):
        # if len(xml) != 1:
        #     raise ValueError(f"gen_inductive only supports non-mutual inductive now")
        sections = [(self.name_of(x), x) for x in xml]
        for (name, _) in sections:
            if '.' in name:
                raise ValueError(f"gen_inductive: {name}")
            full_name = self.qualify(name)
            if full_name in self.defs or full_name in self._atoms or full_name in self.binops:
                return
        self.file.write('inductive ')
        consts = set()
        for (i, (name, body)) in enumerate(sections):
            if i > 0:
                self.file.write(' and ')
            self.file.write(quote(name))
            self.file.write(' :: \"')
            self.gen_typ(0, body[0])
            self.file.write('\"')
            consts.add(name)
        self.file.write(' where\n')
        total_prems_concls = {}
        for j, (name, body) in enumerate(sections):
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
            total_prems_concls[name] = prems_concls

            for i, (rule_name, prems, concl) in enumerate(prems_concls):
                if i + j > 0:
                    self.file.write(' | ')
                else:
                    self.file.write('   ')
                if '.' in rule_name:
                    raise ValueError(f"gen_inductive: {rule_name}")
                self.file.write(quote(rule_name))
                self.file.write(': ')
                vars = {}
                self.file.write('\"')
                for expr in prems:
                    self.gen_term_i(2, expr)
                    self.file.write(" \\<Longrightarrow> ")
                    collect_vars(expr, vars)
                collect_vars(concl, vars)
                for (name2, _) in sections:
                    if name2 in vars:
                        del vars[name2]
                self.gen_term_i(1, concl)
                self.file.write('\"')
                for j, (k,v) in enumerate(vars.items()):
                    if j == 0:
                        self.file.write(' for ')
                    else:
                        self.file.write(' and ')
                    self.file.write(f"{quote(k)} :: \"")
                    self.gen_typ_i(0, v)
                    self.file.write('\"')
                self.file.write('\n')
            self.decl_atom(name, (name, self.thy_name + '.' + name))

        if self.statistics is not None:
            for j, (name, body) in enumerate(sections):
                deps = set()
                for (rule_name, prems, concls) in total_prems_concls[name]:
                    for prem in prems:
                        constant_dependencies_of(prem, deps)
                    for concl in concls:
                        constant_dependencies_of(concl, deps)
                full_name = self.pretty_qualify(name)
                key = f"const${os.path.relpath(self.file.name, BASE_DIR)}${full_name}"
                self.statistics[key] = list(deps)
                self.statistics.commit()


    def generate(self, xml, gen_goal, thy_name=None):
        if not thy_name:
            thy_name = xml.get('name')
        self.thy_name = thy_name
        self.file.write(f"theory {quote(thy_name)}\n")
        realized = [x for x in xml if x.tag == 'realized']
        imports = []
        for x in realized:
            imports.extend(self.gen_imports(x))
        if self.statistics is not None:
            full_thy_name = f"{self.session}.{thy_name}"
            def pass_import(i):
                match i.split('.'):
                    case [_]:
                        return 'Why3STD.' + i
                    case _:
                        return i
            self.statistics[f"thy${full_thy_name}"] = [pass_import(i) for i in imports]
            self.statistics.commit()


        def filter_import(i):
            [s,t] = i.split('.')
            if s in self.qualifiers:
                if self.working_mlw_file is None:
                    return t
                elif Exporter.is_single_file(self.working_mlw_file):
                    return "./" + t
                else:
                    return '../../lib/isabelle/' + t
            return i
        imports = list(map(filter_import, imports))
        self.file.write(f"  imports {' '.join([quote(i) for i in imports])}\nbegin\n")

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
        self.file.write("end\n")

        sessions = set()
        for i in imports:
            if i.startswith('.'):
                continue
            match i.split('.'):
                case [s,_]:
                    sessions.add(s)
                case [_]:
                    sessions.add('Why3STD')
                case _:
                    raise ValueError(f"Bad import {i}")
        return sessions

    @staticmethod
    def session_of(mlw_path):
        level = Exporter.depth_of_file(mlw_path)
        return os.path.splitext(mlw_path)[0].split('/')[-level-1]

    @staticmethod
    def write_ROOT(output_dir, session, dep_sessions, theories):
        os.makedirs(output_dir, exist_ok=True)
        with open(os.path.join(output_dir, 'ROOT'), 'w') as f:
            f.write(f"session {quote(session)} = NTP4Verif +\n")
            if dep_sessions:
                f.write(f"sessions\n")
                for s in dep_sessions:
                    f.write(f"  \"{s}\"\n")
            if theories:
                f.write(f"theories\n")
            for t in theories:
                f.write(f"  \"{t}\"\n")

    @staticmethod
    def load_dep_sessions(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        if os.path.exists(os.path.join(output_dir, 'dep_sessions.lst')):
            with open(os.path.join(output_dir, 'dep_sessions.lst'), 'r') as f:
                dep_sessions = set([x.strip() for x in f.read().splitlines()])
        else:
            dep_sessions = set()
        return dep_sessions
    
    @staticmethod
    def load_theories(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        if os.path.exists(os.path.join(output_dir, 'theories.lst')):
            with open(os.path.join(output_dir, 'theories.lst'), 'r') as f:
                theories = [x.strip() for x in f.read().splitlines()]
        else:
            theories = []
        return theories

    @staticmethod
    def load_roots(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        if os.path.exists(os.path.join(output_dir, 'ROOTS')):
            with open(os.path.join(output_dir, 'ROOTS'), 'r') as f:
                roots = [x.strip() for x in f.read().splitlines()]
        else:
            roots = []
        return roots

    @classmethod
    def realize_impl(cls, module_name, mlw_path, xml, statistics=None):
        parts = module_name.split('.')
        
        if mlw_path is None:
            # system library
            session = '_'.join(parts[:-2])
            thy_name = '_'.join(parts[-2:])
            if not session or session == 'why3':
                session = 'Why3STD'

            output_dir = "./generation/isabelle"

            if os.path.exists(os.path.join(output_dir, 'ROOTS')):
                with open(os.path.join(output_dir, 'ROOTS'), 'r') as f:
                    sessions = [s.strip() for s in f.read().splitlines()]
            else:
                sessions = []
            if session not in sessions:
                sessions.append(session)
                with open(os.path.join(output_dir, 'ROOTS'), 'a') as f:
                    f.write(f"{session}\n")

            output_dir = os.path.join(output_dir, session)
        else:
            output_dir = cls.lib_dir_of(mlw_path)
            if len(parts) > 2:
                raise RuntimeError(f"Local module {module_name} cannot have more than one qualifier")
            session = Isabelle_Exporter.session_of(mlw_path)
            thy_name = module_name.translate(THY_NAME_TRANSLATION)

        if thy_name and not thy_name[0].isalpha():
            thy_name = 'X' + thy_name

        with locker:
            theories = Isabelle_Exporter.load_theories(output_dir)
            dep_sessions = Isabelle_Exporter.load_dep_sessions(output_dir)

            logger.info(f"Generating the dependency {os.path.join(output_dir, thy_name + '.thy')}")
            thy_file = os.path.join(output_dir, thy_name + '.thy')
            if os.path.exists(thy_file) and not os.access(thy_file, os.W_OK):
                logger.info(f"{thy_file} exists and is not writable, skipping...")
            else:
                with open(thy_file, 'w') as f:
                    exporter = Isabelle_Exporter(f, module_name, mlw_path, session=session, statistics=statistics)
                    if exporter.qualifiers is None:
                        exporter.qualifiers = [session]
                    s = exporter.generate(xml, False, thy_name)
                    if session in s:
                        s.remove(session)
                    if 'NTP4Verif' in s:
                        s.remove('NTP4Verif')
                    if any(x not in dep_sessions for x in s):
                        with open(os.path.join(output_dir, 'dep_sessions.lst'), 'a') as f:
                            for x in s:
                                if x not in dep_sessions:
                                    f.write(x + '\n')
                                    dep_sessions.add(x)

            if thy_name not in theories:
                with open(os.path.join(output_dir, 'theories.lst'), 'a') as f:
                    f.write(f"{thy_name}\n")
                theories.append(thy_name)

            Isabelle_Exporter.write_ROOT(output_dir, session, dep_sessions, theories)

        return exporter.dump_module(module_name, session + "." + thy_name)

    @classmethod
    def VCG_impl(cls, mlw_path, xml, xml_path, statistics=None):
        output_dir = os.path.dirname(xml_path)
        thy_name = os.path.splitext(os.path.basename(xml_path))[0]
        if thy_name and not thy_name[0].isalpha():
            thy_name = 'X' + thy_name

        session = os.path.splitext(os.path.basename(mlw_path))[0]
        with locker:
            theories = Isabelle_Exporter.load_theories(output_dir)
            dep_sessions = Isabelle_Exporter.load_dep_sessions(output_dir)
            if thy_name not in theories:
                with open(os.path.join(output_dir, 'theories.lst'), 'a') as f:
                    f.write(f"{thy_name}\n")
                theories.append(thy_name)
                Isabelle_Exporter.write_ROOT(output_dir, session, dep_sessions, theories)

            cat_dir = Exporter.benchmark_cat_dir_of(output_dir)
            rel_output_dir = os.path.relpath(output_dir, cat_dir)
            roots = Isabelle_Exporter.load_roots(cat_dir)
            if rel_output_dir not in roots:
                with open(os.path.join(cat_dir, 'ROOTS'), 'a') as f:
                    f.write(f"{rel_output_dir}\n")

        path = os.path.join(output_dir, thy_name + '.thy')
        logger.info(f"Generating the VC {path}")
        if os.path.exists(path) and not os.access(path, os.W_OK):
            logger.info(f"{path} exists and is not writable, skipping VCG...")
        else:
            with open(path, 'w') as file:
                exporter = cls(file, 'VCG_endpoint', mlw_path, easy_mode=False, statistics=statistics, session=session)
                exporter.generate(xml, True, thy_name)
        ret = syntax_check(path, print=False, statistics=statistics)
        if not ret:
            with open(path, 'w') as file:
                exporter = cls(file, 'VCG_endpoint', mlw_path, easy_mode=True, statistics=statistics, session=session)
                exporter.generate(xml, True, thy_name)
            ret = syntax_check(path, statistics=statistics)
        return ret

PRINTERS['isabelle'] = Isabelle_Exporter

def syntax_check(file, print=True, statistics=None):
    addr = os.environ.get('ISA_REPL_ADDR')
    if not addr:
        #logger.error("ISA_REPL_ADDR environment variable not set")
        return False
    logger.info(f"Syntax checking {file}")
    time_start_all = time.time()
    from IsaREPL import Client
    with Client(addr, 'NTP4Verif') as client:
        last_sorry_line = None
        with open(file, 'r', encoding='utf-8') as f:
            for idx, line in enumerate(f, start=1):
                if line.strip() == 'sorry':
                    last_sorry_line = idx
        client.set_register_thy (False)
        client.load_theory(['NTP4Verfif_VC.Info_VC'])
        try:
            client.set_thy_qualifier(Isabelle_Exporter.session_of(file))
            start_time = time.time()
            client.file(file, attrs=['quick_and_dirty'], timeout=60000, line=last_sorry_line)
            end_time = time.time()
            logger.info(f"File loading took {end_time - start_time} seconds")
        except Exception as e:
            if print:
                logger.error(f"Syntax check failed for {file}:\n{e}")
            return False
        if statistics is not None:
            logger.info(f"Running Info_VC for {file}")
            time_start = time.time()
            client.run_app('Info_VC')
            time_end1 = time.time()
            logger.info(f"Load Info_VC took {time_end1 - time_start} seconds")
            data = client.unpack.unpack()
            time_end = time.time()
            logger.info(f"Info_VC took {time_end - time_start} seconds")
            rel_path = os.path.relpath(file, BASE_DIR)
            statistics[f"VC${rel_path}"] = data
            statistics.commit()
            time_end2 = time.time()
            logger.info(f"Update Database took {time_end2 - time_end} seconds")

    time_end_all = time.time()
    logger.info(f"Syntax check passed for {file} in {time_end_all - time_start_all} seconds")
    return True
