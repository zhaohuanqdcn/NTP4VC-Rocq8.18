import Why3.Base
open Classical
open Lean4Why3
namespace power_FastExponentiation_fast_expqtvc
theorem fast_exp'vc (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv n (2 : ℤ); (((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1) ∧ ¬(2 : ℤ) = (0 : ℤ))) ∧ (∀(result : ℤ), (if n = (0 : ℤ) then result = (1 : ℤ) else let r : ℤ := HPow.hPow x (Int.toNat (Int.tdiv n (2 : ℤ))); if Int.tmod n (2 : ℤ) = (0 : ℤ) then result = r * r else result = r * r * x) → result = HPow.hPow x (Int.toNat n))
  := sorry
end power_FastExponentiation_fast_expqtvc
