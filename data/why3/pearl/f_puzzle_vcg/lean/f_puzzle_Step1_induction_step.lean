import Why3.Base
import pearl.f_puzzle_vcg.lean.f_puzzle.Puzzle
open Classical
open Lean4Why3
namespace f_puzzle_Step1_induction_step
noncomputable def p (k : ℤ) := ∀(n : ℤ), (0 : ℤ) ≤ n → k ≤ Puzzle.f (n + k)
axiom base : p (0 : ℤ)
theorem induction_step (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : p n) : p (n + (1 : ℤ))
  := sorry
end f_puzzle_Step1_induction_step
