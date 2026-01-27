import Why3.Base
import Why3.int.Div2
import pearl.euler001_vcg.lean.euler001.DivModHints
import pearl.euler001_vcg.lean.euler001.TriangularNumbers
import pearl.euler001_vcg.lean.euler001.SumMultiple
open Classical
open Lean4Why3
namespace euler001_Euler001_solveqtvc
theorem solve'vc (n : ℤ) (fact0 : (1 : ℤ) ≤ n) : ¬(3 : ℤ) = (0 : ℤ) ∧ (let n3 : ℤ := Int.tdiv (n - (1 : ℤ)) (3 : ℤ); ¬(5 : ℤ) = (0 : ℤ) ∧ (let n5 : ℤ := Int.tdiv (n - (1 : ℤ)) (5 : ℤ); ¬(15 : ℤ) = (0 : ℤ) ∧ (let n15 : ℤ := Int.tdiv (n - (1 : ℤ)) (15 : ℤ); ¬(2 : ℤ) = (0 : ℤ) ∧ Int.tdiv ((3 : ℤ) * n3 * (n3 + (1 : ℤ)) + (5 : ℤ) * n5 * (n5 + (1 : ℤ)) - (15 : ℤ) * n15 * (n15 + (1 : ℤ))) (2 : ℤ) = SumMultiple.sum_multiple_3_5_lt n)))
  := sorry
end euler001_Euler001_solveqtvc
