import Why3.Base
open Classical
open Lean4Why3
namespace gcd_vc_sp_BinaryGcd_gcd_even_evenqtvc
theorem gcd_even_even'vc (v : ℤ) (u : ℤ) (fact0 : (0 : ℤ) ≤ v) (fact1 : (0 : ℤ) ≤ u) : Int.ofNat (Int.gcd ((2 : ℤ) * u) ((2 : ℤ) * v)) = (2 : ℤ) * Int.ofNat (Int.gcd u v)
  := sorry
end gcd_vc_sp_BinaryGcd_gcd_even_evenqtvc
