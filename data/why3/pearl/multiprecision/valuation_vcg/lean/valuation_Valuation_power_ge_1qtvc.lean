import Why3.Base
open Classical
open Lean4Why3
namespace valuation_Valuation_power_ge_1qtvc
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
theorem power_ge_1'vc (b : ℤ) (e : ℤ) (fact0 : (1 : ℤ) ≤ b) (fact1 : (0 : ℤ) ≤ e) : (1 : ℤ) ≤ HPow.hPow b (Int.toNat e)
  := sorry
end valuation_Valuation_power_ge_1qtvc
