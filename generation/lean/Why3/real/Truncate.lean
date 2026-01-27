import Why3.Base
open Classical
open Lean4Why3
namespace Truncate
axiom truncate : ℝ -> ℤ
axiom Truncate_int (i : ℤ) : truncate (Int.to_Real i) = i
axiom Truncate_down_pos (x : ℝ) (fact0 : (0 : ℝ) ≤ x) : Int.to_Real (truncate x) ≤ x ∧ x < Int.to_Real (truncate x + (1 : ℤ))
axiom Truncate_up_neg (x : ℝ) (fact0 : x ≤ (0 : ℝ)) : Int.to_Real (truncate x - (1 : ℤ)) < x ∧ x ≤ Int.to_Real (truncate x)
axiom Real_of_truncate (x : ℝ) : x - (1 : ℝ) ≤ Int.to_Real (truncate x) ∧ Int.to_Real (truncate x) ≤ x + (1 : ℝ)
axiom Truncate_monotonic (x : ℝ) (y : ℝ) (fact0 : x ≤ y) : truncate x ≤ truncate y
axiom Truncate_monotonic_int1 (x : ℝ) (i : ℤ) (fact0 : x ≤ Int.to_Real i) : truncate x ≤ i
axiom Truncate_monotonic_int2 (i : ℤ) (x : ℝ) (fact0 : Int.to_Real i ≤ x) : i ≤ truncate x
axiom floor : ℝ -> ℤ
axiom Floor_int (i : ℤ) : floor (Int.to_Real i) = i
axiom ceil : ℝ -> ℤ
axiom Ceil_int (i : ℤ) : ceil (Int.to_Real i) = i
axiom Floor_down (x : ℝ) : Int.to_Real (floor x) ≤ x ∧ x < Int.to_Real (floor x + (1 : ℤ))
axiom Ceil_up (x : ℝ) : Int.to_Real (ceil x - (1 : ℤ)) < x ∧ x ≤ Int.to_Real (ceil x)
axiom Floor_monotonic (x : ℝ) (y : ℝ) (fact0 : x ≤ y) : floor x ≤ floor y
axiom Ceil_monotonic (x : ℝ) (y : ℝ) (fact0 : x ≤ y) : ceil x ≤ ceil y
end Truncate
