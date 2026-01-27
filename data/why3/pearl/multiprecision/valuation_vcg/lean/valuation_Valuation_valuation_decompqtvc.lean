import Why3.Base
open Classical
open Lean4Why3
namespace valuation_Valuation_valuation_decompqtvc
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
theorem valuation_decomp'vc (n : ℤ) (p : ℤ) (fact0 : (1 : ℤ) ≤ n) (fact1 : (1 : ℤ) < p) : n = HPow.hPow p (Int.toNat (valuation n p)) * Int.tdiv n (HPow.hPow p (Int.toNat (valuation n p)))
  := sorry
end valuation_Valuation_valuation_decompqtvc
