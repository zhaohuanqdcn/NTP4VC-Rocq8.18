import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
open Classical
open Lean4Why3
namespace Typing
noncomputable def type_value (v : Syntax.value) := match v with | Syntax.value.Vvoid => Syntax.datatype.TYunit | Syntax.value.Vint _ => Syntax.datatype.TYint | Syntax.value.Vbool _ => Syntax.datatype.TYbool
inductive type_operator : Syntax.operator -> Syntax.datatype -> Syntax.datatype -> Syntax.datatype -> Prop where
 | Type_plus : type_operator Syntax.operator.Oplus Syntax.datatype.TYint Syntax.datatype.TYint Syntax.datatype.TYint
 | Type_minus : type_operator Syntax.operator.Ominus Syntax.datatype.TYint Syntax.datatype.TYint Syntax.datatype.TYint
 | Type_mult : type_operator Syntax.operator.Omult Syntax.datatype.TYint Syntax.datatype.TYint Syntax.datatype.TYint
 | Type_le : type_operator Syntax.operator.Ole Syntax.datatype.TYint Syntax.datatype.TYint Syntax.datatype.TYbool
axiom type_stack : Type
axiom inhabited_axiom_type_stack : Inhabited type_stack
attribute [instance] inhabited_axiom_type_stack
noncomputable def get_vartype : Syntax.ident -> List (Syntax.ident × Syntax.datatype) -> Syntax.datatype
  | i, ([] : List (Syntax.ident × Syntax.datatype)) => Syntax.datatype.TYunit
  | i, (List.cons (x, ty) r) => if x = i then ty else get_vartype i r
axiom type_env : Type
axiom inhabited_axiom_type_env : Inhabited type_env
attribute [instance] inhabited_axiom_type_env
inductive type_term : (Syntax.mident -> Syntax.datatype) -> List (Syntax.ident × Syntax.datatype) -> Syntax.term -> Syntax.datatype -> Prop where
 | Type_value (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (v : Syntax.value) : type_term sigma pi (Syntax.term.Tvalue v) (type_value v)
 | Type_var (v : Syntax.ident) (pi : List (Syntax.ident × Syntax.datatype)) (ty : Syntax.datatype) (sigma : Syntax.mident -> Syntax.datatype) : get_vartype v pi = ty → type_term sigma pi (Syntax.term.Tvar v) ty
 | Type_deref (sigma : Syntax.mident -> Syntax.datatype) (v : Syntax.mident) (ty : Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) : sigma v = ty → type_term sigma pi (Syntax.term.Tderef v) ty
 | Type_bin (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (t1 : Syntax.term) (ty1 : Syntax.datatype) (t2 : Syntax.term) (ty2 : Syntax.datatype) (op : Syntax.operator) (ty : Syntax.datatype) : type_term sigma pi t1 ty1 → type_term sigma pi t2 ty2 → type_operator op ty1 ty2 ty → type_term sigma pi (Syntax.term.Tbin t1 op t2) ty
inductive type_fmla : (Syntax.mident -> Syntax.datatype) -> List (Syntax.ident × Syntax.datatype) -> Syntax.fmla -> Prop where
 | Type_term (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (t : Syntax.term) : type_term sigma pi t Syntax.datatype.TYbool → type_fmla sigma pi (Syntax.fmla.Fterm t)
 | Type_conj (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (f1 : Syntax.fmla) (f2 : Syntax.fmla) : type_fmla sigma pi f1 → type_fmla sigma pi f2 → type_fmla sigma pi (Syntax.fmla.Fand f1 f2)
 | Type_neg (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (f : Syntax.fmla) : type_fmla sigma pi f → type_fmla sigma pi (Syntax.fmla.Fnot f)
 | Type_implies (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (f1 : Syntax.fmla) (f2 : Syntax.fmla) : type_fmla sigma pi f1 → type_fmla sigma pi f2 → type_fmla sigma pi (Syntax.fmla.Fimplies f1 f2)
 | Type_let (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (t : Syntax.term) (ty : Syntax.datatype) (x : Syntax.ident) (f : Syntax.fmla) : type_term sigma pi t ty → type_fmla sigma (List.cons (x, ty) pi) f → type_fmla sigma pi (Syntax.fmla.Flet x t f)
 | Type_forall (sigma : Syntax.mident -> Syntax.datatype) (x : Syntax.ident) (ty : Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (f : Syntax.fmla) : type_fmla sigma (List.cons (x, ty) pi) f → type_fmla sigma pi (Syntax.fmla.Fforall x ty f)
inductive type_stmt : (Syntax.mident -> Syntax.datatype) -> List (Syntax.ident × Syntax.datatype) -> Syntax.stmt -> Prop where
 | Type_skip (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) : type_stmt sigma pi Syntax.stmt.Sskip
 | Type_seq (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (s1 : Syntax.stmt) (s2 : Syntax.stmt) : type_stmt sigma pi s1 → type_stmt sigma pi s2 → type_stmt sigma pi (Syntax.stmt.Sseq s1 s2)
 | Type_assigns (sigma : Syntax.mident -> Syntax.datatype) (x : Syntax.mident) (ty : Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (t : Syntax.term) : sigma x = ty → type_term sigma pi t ty → type_stmt sigma pi (Syntax.stmt.Sassign x t)
 | Type_if (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (t : Syntax.term) (s1 : Syntax.stmt) (s2 : Syntax.stmt) : type_term sigma pi t Syntax.datatype.TYbool → type_stmt sigma pi s1 → type_stmt sigma pi s2 → type_stmt sigma pi (Syntax.stmt.Sif t s1 s2)
 | Type_assert (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (p : Syntax.fmla) : type_fmla sigma pi p → type_stmt sigma pi (Syntax.stmt.Sassert p)
 | Type_while (sigma : Syntax.mident -> Syntax.datatype) (pi : List (Syntax.ident × Syntax.datatype)) (inv : Syntax.fmla) (cond : Syntax.term) (body : Syntax.stmt) : type_fmla sigma pi inv → type_term sigma pi cond Syntax.datatype.TYbool → type_stmt sigma pi body → type_stmt sigma pi (Syntax.stmt.Swhile cond inv body)
end Typing
