import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace nistonacci_Top_nistonacciqtvc
axiom nist : ℤ -> ℤ
axiom nist'def (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : if n < (2 : ℤ) then nist n = n else nist n = nist (n - (2 : ℤ)) + (2 : ℤ) * nist (n - (1 : ℤ))
theorem nistonacci'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ o1 + (1 : ℤ) → ((0 : ℤ) = nist (0 : ℤ) ∧ (1 : ℤ) = nist ((0 : ℤ) + (1 : ℤ))) ∧ (∀(y : ℤ) (x : ℤ), (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o1) ∧ x = nist i ∧ y = nist (i + (1 : ℤ)) → y = nist (i + (1 : ℤ)) ∧ x + (2 : ℤ) * y = nist (i + (1 : ℤ) + (1 : ℤ))) ∧ (x = nist (o1 + (1 : ℤ)) ∧ y = nist (o1 + (1 : ℤ) + (1 : ℤ)) → x = nist n))) ∧ (o1 + (1 : ℤ) < (0 : ℤ) → (0 : ℤ) = nist n)
  := sorry
end nistonacci_Top_nistonacciqtvc
