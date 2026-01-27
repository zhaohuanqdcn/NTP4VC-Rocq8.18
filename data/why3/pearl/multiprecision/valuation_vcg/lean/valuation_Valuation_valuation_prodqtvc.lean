import Why3.Base
open Classical
open Lean4Why3
namespace valuation_Valuation_valuation_prodqtvc
axiom valuation : ℤ -> ℤ -> ℤ
axiom valuation'def (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : if Int.tmod n p = (0 : ℤ) then valuation n p = valuation (Int.tdiv n p) p + (1 : ℤ) else valuation n p = (0 : ℤ)
axiom valuation'spec'0 (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : (0 : ℤ) ≤ valuation n p
axiom valuation'spec (p : ℤ) (n : ℤ) (fact0 : (1 : ℤ) < p) (fact1 : (1 : ℤ) ≤ n) : HPow.hPow p (Int.toNat (valuation n p)) ∣  n
theorem valuation_prod'vc (n1 : ℤ) (n2 : ℤ) (p : ℤ) (fact0 : (1 : ℤ) ≤ n1) (fact1 : (1 : ℤ) ≤ n2) (fact2 : Nat.Prime (Int.toNat p)) : valuation (n1 * n2) p = valuation n1 p + valuation n2 p
  := sorry
end valuation_Valuation_valuation_prodqtvc
