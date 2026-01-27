import Why3.Base
import Why3.int.Div2
import pearl.euler001_vcg.lean.euler001.DivModHints
import pearl.euler001_vcg.lean.euler001.TriangularNumbers
open Classical
open Lean4Why3
namespace euler001_SumMultiple_closed_formula_0qtvc
axiom sum_multiple_3_5_lt : ℤ -> ℤ
axiom SumEmpty : sum_multiple_3_5_lt (0 : ℤ) = (0 : ℤ)
axiom SumNo (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : ¬Int.tmod n (3 : ℤ) = (0 : ℤ)) (fact2 : ¬Int.tmod n (5 : ℤ) = (0 : ℤ)) : sum_multiple_3_5_lt (n + (1 : ℤ)) = sum_multiple_3_5_lt n
axiom SumYes (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : Int.tmod n (3 : ℤ) = (0 : ℤ) ∨ Int.tmod n (5 : ℤ) = (0 : ℤ)) : sum_multiple_3_5_lt (n + (1 : ℤ)) = sum_multiple_3_5_lt n + n
noncomputable def closed_formula_aux (n : ℤ) := let n3 : ℤ := Int.tdiv n (3 : ℤ); let n5 : ℤ := Int.tdiv n (5 : ℤ); let n15 : ℤ := Int.tdiv n (15 : ℤ); (3 : ℤ) * TriangularNumbers.tr n3 + (5 : ℤ) * TriangularNumbers.tr n5 - (15 : ℤ) * TriangularNumbers.tr n15
noncomputable def p (n : ℤ) := sum_multiple_3_5_lt (n + (1 : ℤ)) = closed_formula_aux n
theorem closed_formula_0'vc : p (0 : ℤ)
  := sorry
end euler001_SumMultiple_closed_formula_0qtvc
