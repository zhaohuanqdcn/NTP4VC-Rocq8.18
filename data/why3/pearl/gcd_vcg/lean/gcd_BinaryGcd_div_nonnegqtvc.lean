import Why3.Base
open Classical
open Lean4Why3
namespace gcd_BinaryGcd_div_nonnegqtvc
theorem div_nonneg'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ Int.tdiv n (2 : ℤ)
  := sorry
end gcd_BinaryGcd_div_nonnegqtvc
