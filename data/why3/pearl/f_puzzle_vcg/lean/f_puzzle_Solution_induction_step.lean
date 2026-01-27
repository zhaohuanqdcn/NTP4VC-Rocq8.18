import Why3.Base
import pearl.f_puzzle_vcg.lean.f_puzzle.Puzzle
import pearl.f_puzzle_vcg.lean.f_puzzle.Step1
open Classical
open Lean4Why3
namespace f_puzzle_Solution_induction_step
noncomputable def p' (k : ℤ) := ∀(n : ℤ) (m : ℤ), (0 : ℤ) ≤ n ∧ n ≤ m ∧ m ≤ k → Puzzle.f n ≤ Puzzle.f m
axiom base : p' (0 : ℤ)
theorem induction_step (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : p' n) : p' (n + (1 : ℤ))
  := sorry
end f_puzzle_Solution_induction_step
