import Why3.Base
import Why3.int.Fact
open Classical
open Lean4Why3
namespace fact_FactRecursive_fact_recqtvc
theorem fact_rec'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (¬x = (0 : ℤ) → (let o1 : ℤ := x - (1 : ℤ); ((0 : ℤ) ≤ x ∧ o1 < x) ∧ (0 : ℤ) ≤ o1)) ∧ (∀(result : ℤ), (if x = (0 : ℤ) then result = (1 : ℤ) else result = x * Fact.fact (x - (1 : ℤ))) → result = Fact.fact x)
  := sorry
end fact_FactRecursive_fact_recqtvc
