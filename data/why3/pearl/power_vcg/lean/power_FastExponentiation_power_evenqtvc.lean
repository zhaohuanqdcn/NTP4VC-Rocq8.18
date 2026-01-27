import Why3.Base
open Classical
open Lean4Why3
namespace power_FastExponentiation_power_evenqtvc
theorem power_even'vc (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : Int.tmod n (2 : ℤ) = (0 : ℤ)) : HPow.hPow x (Int.toNat n) = HPow.hPow (x * x) (Int.toNat (Int.tdiv n (2 : ℤ)))
  := sorry
end power_FastExponentiation_power_evenqtvc
