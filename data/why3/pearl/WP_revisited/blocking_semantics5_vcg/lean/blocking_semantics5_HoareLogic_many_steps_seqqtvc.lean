import Why3.Base
import pearl.WP_revisited.lib.lean.blocking_semantics5.Syntax
import pearl.WP_revisited.lib.lean.blocking_semantics5.SemOp
import pearl.WP_revisited.lib.lean.blocking_semantics5.FreshVariables
open Classical
open Lean4Why3
namespace blocking_semantics5_HoareLogic_many_steps_seqqtvc
theorem many_steps_seq'vc (sigma1 : Syntax.mident -> Syntax.value) (pi1 : List (Syntax.ident × Syntax.value)) (s1 : Syntax.stmt) (s2 : Syntax.stmt) (sigma3 : Syntax.mident -> Syntax.value) (pi3 : List (Syntax.ident × Syntax.value)) (n : ℤ) (fact0 : SemOp.many_steps sigma1 pi1 (Syntax.stmt.Sseq s1 s2) sigma3 pi3 Syntax.stmt.Sskip n) : ∃(sigma2 : Syntax.mident -> Syntax.value) (pi2 : List (Syntax.ident × Syntax.value)) (n1 : ℤ) (n2 : ℤ), SemOp.many_steps sigma1 pi1 s1 sigma2 pi2 Syntax.stmt.Sskip n1 ∧ SemOp.many_steps sigma2 pi2 s2 sigma3 pi3 Syntax.stmt.Sskip n2 ∧ n = (1 : ℤ) + n1 + n2
  := sorry
end blocking_semantics5_HoareLogic_many_steps_seqqtvc
