import Why3.Base
open Classical
open Lean4Why3
namespace valuation_Valuation_valuationqtvc
theorem valuation'vc (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : ¬p = (0 : ℤ) ∧ (let o1 : ℤ := Int.tmod n p; (o1 = (0 : ℤ) → ¬p = (0 : ℤ) ∧ (let d : ℤ := Int.tdiv n p; ((0 : ℤ) ≤ n ∧ d < n) ∧ (1 : ℤ) < p ∧ (1 : ℤ) ≤ d)) ∧ (∀(result : ℤ), (if o1 = (0 : ℤ) then ∃(r : ℤ), ((0 : ℤ) ≤ r ∧ HPow.hPow p (Int.toNat r) ∣  Int.tdiv n p) ∧ result = r + (1 : ℤ) else result = (0 : ℤ)) → (0 : ℤ) ≤ result ∧ HPow.hPow p (Int.toNat result) ∣  n))
  := sorry
end valuation_Valuation_valuationqtvc
