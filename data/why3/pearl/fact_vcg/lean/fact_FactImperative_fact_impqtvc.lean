import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Fact
open Classical
open Lean4Why3
namespace fact_FactImperative_fact_impqtvc
theorem fact_imp'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ x ∧ (1 : ℤ) = Fact.fact (0 : ℤ) ∧ (∀(y : ℤ), (0 : ℤ) ≤ y ∧ y ≤ x → (if y < x then ((0 : ℤ) ≤ x - y ∧ x - (y + (1 : ℤ)) < x - y) ∧ ((0 : ℤ) ≤ y + (1 : ℤ) ∧ y + (1 : ℤ) ≤ x) ∧ Fact.fact y * (y + (1 : ℤ)) = Fact.fact (y + (1 : ℤ)) else Fact.fact y = Fact.fact x))
  := sorry
end fact_FactImperative_fact_impqtvc
