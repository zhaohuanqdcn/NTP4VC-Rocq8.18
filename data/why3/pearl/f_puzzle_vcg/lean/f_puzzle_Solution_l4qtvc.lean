import Why3.Base
import pearl.f_puzzle_vcg.lean.f_puzzle.Puzzle
import pearl.f_puzzle_vcg.lean.f_puzzle.Step1
open Classical
open Lean4Why3
namespace f_puzzle_Solution_l4qtvc
theorem l4'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : Puzzle.f n < Puzzle.f (n + (1 : ℤ))
  := sorry
end f_puzzle_Solution_l4qtvc
