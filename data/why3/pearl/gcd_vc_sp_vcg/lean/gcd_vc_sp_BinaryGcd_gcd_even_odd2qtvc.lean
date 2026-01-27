import Why3.Base
open Classical
open Lean4Why3
namespace gcd_vc_sp_BinaryGcd_gcd_even_odd2qtvc
theorem gcd_even_odd2'vc (v : ℤ) (u : ℤ) (fact0 : (0 : ℤ) ≤ v) (fact1 : (0 : ℤ) ≤ u) (fact2 : Even u) (fact3 : Odd v) : Int.gcd u v = Int.gcd (Int.tdiv u (2 : ℤ)) v
  := sorry
end gcd_vc_sp_BinaryGcd_gcd_even_odd2qtvc
