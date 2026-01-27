import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.FreshVariables
open Classical
open Lean4Why3
namespace blocking_semantics5_HoareLogic_assert_rule_extqtvc
noncomputable def valid_triple (p : Syntax.fmla) (s : Syntax.stmt) (q : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), SemOp.eval_fmla sigma pi p → (∀(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (n : ℤ), SemOp.many_steps sigma pi s sigma' pi' Syntax.stmt.Sskip n → SemOp.eval_fmla sigma' pi' q)
noncomputable def total_valid_triple (p : Syntax.fmla) (s : Syntax.stmt) (q : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), SemOp.eval_fmla sigma pi p → (∃(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (n : ℤ), SemOp.many_steps sigma pi s sigma' pi' Syntax.stmt.Sskip n ∧ SemOp.eval_fmla sigma' pi' q)
theorem assert_rule_ext'vc (f : Syntax.fmla) (p : Syntax.fmla) : valid_triple (Syntax.fmla.Fimplies f p) (Syntax.stmt.Sassert f) p
  := sorry
end blocking_semantics5_HoareLogic_assert_rule_extqtvc
