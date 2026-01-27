import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace sf_HoareLogic_factorialqtvc
inductive even : ℤ -> Prop where
 | even_0 : even (0 : ℤ)
 | even_odd (x : ℤ) : even x → even (x + (2 : ℤ))
axiom fact : ℤ -> ℤ
axiom fact_0 : fact (0 : ℤ) = (1 : ℤ)
axiom fact_n (n : ℤ) (fact0 : (0 : ℤ) < n) : fact n = n * fact (n - (1 : ℤ))
theorem factorial'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ x ∧ (1 : ℤ) * fact x = fact x ∧ (∀(z : ℤ) (y : ℤ), (0 : ℤ) ≤ z ∧ y * fact z = fact x → (if ¬z = (0 : ℤ) then ((0 : ℤ) ≤ z ∧ z - (1 : ℤ) < z) ∧ (0 : ℤ) ≤ z - (1 : ℤ) ∧ y * z * fact (z - (1 : ℤ)) = fact x else y = fact x))
  := sorry
end sf_HoareLogic_factorialqtvc
