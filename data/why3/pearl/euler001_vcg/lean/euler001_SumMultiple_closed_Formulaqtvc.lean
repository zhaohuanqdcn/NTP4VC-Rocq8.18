import Why3.Base
import Why3.int.Div2
import pearl.euler001_vcg.lean.euler001.DivModHints
import pearl.euler001_vcg.lean.euler001.TriangularNumbers
open Classical
open Lean4Why3
namespace euler001_SumMultiple_closed_Formulaqtvc
axiom sum_multiple_3_5_lt : ℤ -> ℤ
axiom SumEmpty : sum_multiple_3_5_lt (0 : ℤ) = (0 : ℤ)
axiom SumNo (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : ¬Int.tmod n (3 : ℤ) = (0 : ℤ)) (fact2 : ¬Int.tmod n (5 : ℤ) = (0 : ℤ)) : sum_multiple_3_5_lt (n + (1 : ℤ)) = sum_multiple_3_5_lt n
axiom SumYes (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : Int.tmod n (3 : ℤ) = (0 : ℤ) ∨ Int.tmod n (5 : ℤ) = (0 : ℤ)) : sum_multiple_3_5_lt (n + (1 : ℤ)) = sum_multiple_3_5_lt n + n
noncomputable def closed_formula_aux (n : ℤ) := let n3 : ℤ := Int.tdiv n (3 : ℤ); let n5 : ℤ := Int.tdiv n (5 : ℤ); let n15 : ℤ := Int.tdiv n (15 : ℤ); (3 : ℤ) * TriangularNumbers.tr n3 + (5 : ℤ) * TriangularNumbers.tr n5 - (15 : ℤ) * TriangularNumbers.tr n15
noncomputable def p (n : ℤ) := sum_multiple_3_5_lt (n + (1 : ℤ)) = closed_formula_aux n
axiom Induction (n : ℤ) (fact0 : ∀(n : ℤ), (0 : ℤ) ≤ n → (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n → p k) → p n) (fact1 : (0 : ℤ) ≤ n) : p n
axiom Induction_bound (n : ℤ) (fact0 : ∀(n : ℤ), (0 : ℤ) ≤ n → (∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < n → p k) → p n) (fact1 : (0 : ℤ) ≤ n) : p n
noncomputable def closed_formula (n : ℤ) := let n3 : ℤ := Int.tdiv n (3 : ℤ); let n5 : ℤ := Int.tdiv n (5 : ℤ); let n15 : ℤ := Int.tdiv n (15 : ℤ); Int.tdiv ((3 : ℤ) * (n3 * (n3 + (1 : ℤ))) + (5 : ℤ) * (n5 * (n5 + (1 : ℤ))) - (15 : ℤ) * (n15 * (n15 + (1 : ℤ)))) (2 : ℤ)
theorem closed_Formula'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : sum_multiple_3_5_lt (n + (1 : ℤ)) = closed_formula n
  := sorry
end euler001_SumMultiple_closed_Formulaqtvc
