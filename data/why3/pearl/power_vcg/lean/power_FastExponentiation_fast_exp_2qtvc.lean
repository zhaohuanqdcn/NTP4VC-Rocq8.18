import Why3.Base
open Classical
open Lean4Why3
namespace power_FastExponentiation_fast_exp_2qtvc
theorem fast_exp_2'vc (n : ℤ) (acc : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) : (¬n = (0 : ℤ) → ¬(2 : ℤ) = (0 : ℤ) ∧ (if Int.tmod n (2 : ℤ) = (0 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ (let o1 : ℤ := Int.tdiv n (2 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1) else let o1 : ℤ := n - (1 : ℤ); ((0 : ℤ) ≤ n ∧ o1 < n) ∧ (0 : ℤ) ≤ o1)) ∧ (∀(result : ℤ), (if n = (0 : ℤ) then result = acc else if Int.tmod n (2 : ℤ) = (0 : ℤ) then result = HPow.hPow (x * x) (Int.toNat (Int.tdiv n (2 : ℤ))) * acc else result = HPow.hPow x (Int.toNat (n - (1 : ℤ))) * (x * acc)) → result = HPow.hPow x (Int.toNat n) * acc)
  := sorry
end power_FastExponentiation_fast_exp_2qtvc
