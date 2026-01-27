import Why3.Base
open Classical
open Lean4Why3
namespace gcd_BinaryGcd_gcd_odd_odd2qtvc
theorem gcd_odd_odd2'vc (v : ℤ) (u : ℤ) (fact0 : (0 : ℤ) ≤ v) (fact1 : v ≤ u) (fact2 : Odd u) (fact3 : Odd v) : Int.gcd u v = Int.gcd (Int.tdiv (u - v) (2 : ℤ)) v
  := sorry
end gcd_BinaryGcd_gcd_odd_odd2qtvc
