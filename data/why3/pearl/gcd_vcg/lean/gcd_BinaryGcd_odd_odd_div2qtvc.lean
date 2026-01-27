import Why3.Base
open Classical
open Lean4Why3
namespace gcd_BinaryGcd_odd_odd_div2qtvc
theorem odd_odd_div2'vc (v : ℤ) (u : ℤ) (fact0 : (0 : ℤ) ≤ v) (fact1 : (0 : ℤ) ≤ u) : Int.tdiv ((2 : ℤ) * u + (1 : ℤ) - ((2 : ℤ) * v + (1 : ℤ))) (2 : ℤ) = u - v
  := sorry
end gcd_BinaryGcd_odd_odd_div2qtvc
