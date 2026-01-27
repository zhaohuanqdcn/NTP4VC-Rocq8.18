import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.FreshVariables
open Classical
open Lean4Why3
namespace blocking_semantics5_HoareLogic_if_ruleqtvc
noncomputable def valid_triple (p : Syntax.fmla) (s : Syntax.stmt) (q : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), SemOp.eval_fmla sigma pi p → (∀(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (n : ℤ), SemOp.many_steps sigma pi s sigma' pi' Syntax.stmt.Sskip n → SemOp.eval_fmla sigma' pi' q)
noncomputable def total_valid_triple (p : Syntax.fmla) (s : Syntax.stmt) (q : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), SemOp.eval_fmla sigma pi p → (∃(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (n : ℤ), SemOp.many_steps sigma pi s sigma' pi' Syntax.stmt.Sskip n ∧ SemOp.eval_fmla sigma' pi' q)
theorem if_rule'vc (p : Syntax.fmla) (t : Syntax.term) (s1 : Syntax.stmt) (q : Syntax.fmla) (s2 : Syntax.stmt) (fact0 : valid_triple (Syntax.fmla.Fand p (Syntax.fmla.Fterm t)) s1 q) (fact1 : valid_triple (Syntax.fmla.Fand p (Syntax.fmla.Fnot (Syntax.fmla.Fterm t))) s2 q) : valid_triple p (Syntax.stmt.Sif t s1 s2) q
  := sorry
end blocking_semantics5_HoareLogic_if_ruleqtvc
