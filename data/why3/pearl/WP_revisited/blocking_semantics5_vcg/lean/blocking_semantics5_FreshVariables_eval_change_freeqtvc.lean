import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
open Classical
open Lean4Why3
namespace blocking_semantics5_FreshVariables_eval_change_freeqtvc
noncomputable def msubst_term : Syntax.term -> Syntax.mident -> Syntax.ident -> Syntax.term
  | (Syntax.term.Tvalue x0), x, v => Syntax.term.Tvalue x0
  | (Syntax.term.Tvar x0), x, v => Syntax.term.Tvar x0
  | (Syntax.term.Tderef y), x, v => if x = y then Syntax.term.Tvar v else Syntax.term.Tderef y
  | (Syntax.term.Tbin t1 op t2), x, v => Syntax.term.Tbin (msubst_term t1 x v) op (msubst_term t2 x v)
noncomputable def msubst : Syntax.fmla -> Syntax.mident -> Syntax.ident -> Syntax.fmla
  | (Syntax.fmla.Fterm e), x, v => Syntax.fmla.Fterm (msubst_term e x v)
  | (Syntax.fmla.Fand f1 f2), x, v => Syntax.fmla.Fand (msubst f1 x v) (msubst f2 x v)
  | (Syntax.fmla.Fnot f1), x, v => Syntax.fmla.Fnot (msubst f1 x v)
  | (Syntax.fmla.Fimplies f1 f2), x, v => Syntax.fmla.Fimplies (msubst f1 x v) (msubst f2 x v)
  | (Syntax.fmla.Flet y t f1), x, v => Syntax.fmla.Flet y (msubst_term t x v) (msubst f1 x v)
  | (Syntax.fmla.Fforall y ty f1), x, v => Syntax.fmla.Fforall y ty (msubst f1 x v)
noncomputable def fresh_in_term : Syntax.ident -> Syntax.term -> Prop
  | id1, (Syntax.term.Tvalue x) => True
  | id1, (Syntax.term.Tderef x) => True
  | id1, (Syntax.term.Tvar i) => ¬id1 = i
  | id1, (Syntax.term.Tbin t1 x t2) => fresh_in_term id1 t1 ∧ fresh_in_term id1 t2
noncomputable def fresh_in_fmla : Syntax.ident -> Syntax.fmla -> Prop
  | id1, (Syntax.fmla.Fterm e) => fresh_in_term id1 e
  | id1, (Syntax.fmla.Fand f1 f2) => fresh_in_fmla id1 f1 ∧ fresh_in_fmla id1 f2
  | id1, (Syntax.fmla.Fimplies f1 f2) => fresh_in_fmla id1 f1 ∧ fresh_in_fmla id1 f2
  | id1, (Syntax.fmla.Fnot f1) => fresh_in_fmla id1 f1
  | id1, (Syntax.fmla.Flet y t f1) => ¬id1 = y ∧ fresh_in_term id1 t ∧ fresh_in_fmla id1 f1
  | id1, (Syntax.fmla.Fforall y x f1) => ¬id1 = y ∧ fresh_in_fmla id1 f1
theorem eval_change_free'vc (id1 : Syntax.ident) (f : Syntax.fmla) (sigma : Syntax.mident -> Syntax.value) (v : Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (fact0 : fresh_in_fmla id1 f) : SemOp.eval_fmla sigma (List.cons (id1, v) pi) f = SemOp.eval_fmla sigma pi f
  := sorry
end blocking_semantics5_FreshVariables_eval_change_freeqtvc
