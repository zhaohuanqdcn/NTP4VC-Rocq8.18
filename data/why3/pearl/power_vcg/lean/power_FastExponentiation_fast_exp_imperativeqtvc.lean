import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace power_FastExponentiation_fast_exp_imperativeqtvc
theorem fast_exp_imperative'vc (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ (1 : ℤ) * HPow.hPow x (Int.toNat n) = HPow.hPow x (Int.toNat n) ∧ (∀(e : ℤ) (p : ℤ) (r : ℤ), (0 : ℤ) ≤ e ∧ r * HPow.hPow p (Int.toNat e) = HPow.hPow x (Int.toNat n) → (if (0 : ℤ) < e then ¬(2 : ℤ) = (0 : ℤ) ∧ (if Int.tmod e (2 : ℤ) = (1 : ℤ) then ¬(2 : ℤ) = (0 : ℤ) ∧ ((0 : ℤ) ≤ e ∧ Int.tdiv e (2 : ℤ) < e) ∧ (0 : ℤ) ≤ Int.tdiv e (2 : ℤ) ∧ r * p * HPow.hPow (p * p) (Int.toNat (Int.tdiv e (2 : ℤ))) = HPow.hPow x (Int.toNat n) else ¬(2 : ℤ) = (0 : ℤ) ∧ ((0 : ℤ) ≤ e ∧ Int.tdiv e (2 : ℤ) < e) ∧ (0 : ℤ) ≤ Int.tdiv e (2 : ℤ) ∧ r * HPow.hPow (p * p) (Int.toNat (Int.tdiv e (2 : ℤ))) = HPow.hPow x (Int.toNat n)) else r = HPow.hPow x (Int.toNat n)))
  := sorry
end power_FastExponentiation_fast_exp_imperativeqtvc
