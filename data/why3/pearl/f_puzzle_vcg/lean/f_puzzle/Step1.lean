import Why3.Base
import pearl.f_puzzle_vcg.lean.f_puzzle.Puzzle
open Classical
open Lean4Why3
namespace Step1
noncomputable def p (k : ℤ) := ∀(n : ℤ), (0 : ℤ) ≤ n → k ≤ Puzzle.f (n + k)
axiom base : p (0 : ℤ)
axiom induction_step (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : p n) : p (n + (1 : ℤ))
axiom SimpleInduction (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : p n
end Step1
