import Why3.Base
open Classical
open Lean4Why3
namespace gcd_BinaryGcd_even1qtvc
theorem even1'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : Even n = (n = (2 : ℤ) * Int.tdiv n (2 : ℤ))
  := sorry
end gcd_BinaryGcd_even1qtvc
