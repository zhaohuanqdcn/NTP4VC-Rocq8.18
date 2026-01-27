import Why3.Base
open Classical
open Lean4Why3
namespace wp2_Imp_eval_change_freeqtvc
inductive datatype where
  | Tint : datatype
  | Tbool : datatype
axiom inhabited_axiom_datatype : Inhabited datatype
attribute [instance] inhabited_axiom_datatype
inductive operator where
  | Oplus : operator
  | Ominus : operator
  | Omult : operator
  | Ole : operator
axiom inhabited_axiom_operator : Inhabited operator
attribute [instance] inhabited_axiom_operator
axiom ident : Type
axiom inhabited_axiom_ident : Inhabited ident
attribute [instance] inhabited_axiom_ident
inductive term where
  | Tconst : ℤ -> term
  | Tvar : ℤ -> term
  | Tderef : ℤ -> term
  | Tbin : term -> operator -> term -> term
axiom inhabited_axiom_term : Inhabited term
attribute [instance] inhabited_axiom_term
inductive fmla where
  | Fterm : term -> fmla
  | Fand : fmla -> fmla -> fmla
  | Fnot : fmla -> fmla
  | Fimplies : fmla -> fmla -> fmla
  | Flet : ℤ -> term -> fmla -> fmla
  | Fforall : ℤ -> datatype -> fmla -> fmla
axiom inhabited_axiom_fmla : Inhabited fmla
attribute [instance] inhabited_axiom_fmla
inductive value where
  | Vint : ℤ -> value
  | Vbool : Bool -> value
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
axiom env : Type
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
noncomputable def eval_bin (x : value) (op : operator) (y : value) := match (x, y) with | (value.Vint x1, value.Vint y1) => (match op with | operator.Oplus => value.Vint (x1 + y1) | operator.Ominus => value.Vint (x1 - y1) | operator.Omult => value.Vint (x1 * y1) | operator.Ole => value.Vbool (if x1 ≤ y1 then true else false)) | (_, _) => value.Vbool false
noncomputable def eval_term : (ℤ -> value) -> (ℤ -> value) -> term -> value
  | sigma, pi, (term.Tconst n) => value.Vint n
  | sigma, pi, (term.Tvar id1) => pi id1
  | sigma, pi, (term.Tderef id1) => sigma id1
  | sigma, pi, (term.Tbin t1 op t2) => eval_bin (eval_term sigma pi t1) op (eval_term sigma pi t2)
noncomputable def eval_fmla : (ℤ -> value) -> (ℤ -> value) -> fmla -> Prop
  | sigma, pi, (fmla.Fterm t) => eval_term sigma pi t = value.Vbool true
  | sigma, pi, (fmla.Fand f1 f2) => eval_fmla sigma pi f1 ∧ eval_fmla sigma pi f2
  | sigma, pi, (fmla.Fnot f1) => ¬eval_fmla sigma pi f1
  | sigma, pi, (fmla.Fimplies f1 f2) => eval_fmla sigma pi f1 → eval_fmla sigma pi f2
  | sigma, pi, (fmla.Flet x t f1) => eval_fmla sigma (Function.update pi x (eval_term sigma pi t)) f1
  | sigma, pi, (fmla.Fforall x datatype.Tint f1) => ∀(n : ℤ), eval_fmla sigma (Function.update pi x (value.Vint n)) f1
  | sigma, pi, (fmla.Fforall x datatype.Tbool f1) => ∀(b : Bool), eval_fmla sigma (Function.update pi x (value.Vbool b)) f1
noncomputable def subst_term : term -> ℤ -> ℤ -> term
  | (term.Tconst x), r, v => term.Tconst x
  | (term.Tvar x), r, v => term.Tvar x
  | (term.Tderef x), r, v => if r = x then term.Tvar v else term.Tderef x
  | (term.Tbin e1 op e2), r, v => term.Tbin (subst_term e1 r v) op (subst_term e2 r v)
noncomputable def fresh_in_term : ℤ -> term -> Prop
  | id1, (term.Tconst x) => True
  | id1, (term.Tvar v) => ¬id1 = v
  | id1, (term.Tderef x) => True
  | id1, (term.Tbin t1 x t2) => fresh_in_term id1 t1 ∧ fresh_in_term id1 t2
noncomputable def fresh_in_fmla : ℤ -> fmla -> Prop
  | id1, (fmla.Fterm e) => fresh_in_term id1 e
  | id1, (fmla.Fand f1 f2) => fresh_in_fmla id1 f1 ∧ fresh_in_fmla id1 f2
  | id1, (fmla.Fimplies f1 f2) => fresh_in_fmla id1 f1 ∧ fresh_in_fmla id1 f2
  | id1, (fmla.Fnot f1) => fresh_in_fmla id1 f1
  | id1, (fmla.Flet y t f1) => ¬id1 = y ∧ fresh_in_term id1 t ∧ fresh_in_fmla id1 f1
  | id1, (fmla.Fforall y x f1) => ¬id1 = y ∧ fresh_in_fmla id1 f1
noncomputable def subst : fmla -> ℤ -> ℤ -> fmla
  | (fmla.Fterm e), x, v => fmla.Fterm (subst_term e x v)
  | (fmla.Fand f1 f2), x, v => fmla.Fand (subst f1 x v) (subst f2 x v)
  | (fmla.Fnot f1), x, v => fmla.Fnot (subst f1 x v)
  | (fmla.Fimplies f1 f2), x, v => fmla.Fimplies (subst f1 x v) (subst f2 x v)
  | (fmla.Flet y t f1), x, v => fmla.Flet y (subst_term t x v) (subst f1 x v)
  | (fmla.Fforall y ty f1), x, v => fmla.Fforall y ty (subst f1 x v)
theorem eval_change_free'vc (id1 : ℤ) (f : fmla) (sigma : ℤ -> value) (pi : ℤ -> value) (v : value) (fact0 : fresh_in_fmla id1 f) : eval_fmla sigma (Function.update pi id1 v) f = eval_fmla sigma pi f
  := sorry
end wp2_Imp_eval_change_freeqtvc
