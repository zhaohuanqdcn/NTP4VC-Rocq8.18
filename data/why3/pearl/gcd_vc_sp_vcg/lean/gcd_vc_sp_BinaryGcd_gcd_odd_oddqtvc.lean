import Why3.Base
open Classical
open Lean4Why3
namespace gcd_vc_sp_BinaryGcd_gcd_odd_oddqtvc
theorem gcd_odd_odd'vc (v : ℤ) (u : ℤ) (fact0 : (0 : ℤ) ≤ v) (fact1 : v ≤ u) : Int.gcd ((2 : ℤ) * u + (1 : ℤ)) ((2 : ℤ) * v + (1 : ℤ)) = Int.gcd (u - v) ((2 : ℤ) * v + (1 : ℤ))
  := sorry
end gcd_vc_sp_BinaryGcd_gcd_odd_oddqtvc
