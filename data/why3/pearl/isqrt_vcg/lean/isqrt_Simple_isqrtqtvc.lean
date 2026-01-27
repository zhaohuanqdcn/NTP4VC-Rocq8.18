import Why3.Base
import Why3.why3.Ref.Ref
import pearl.isqrt_vcg.lean.isqrt.Square
open Classical
open Lean4Why3
namespace isqrt_Simple_isqrtqtvc
theorem isqrt'vc (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ (0 : ℤ) ∧ Square.sqr (0 : ℤ) ≤ x ∧ (1 : ℤ) = Square.sqr ((0 : ℤ) + (1 : ℤ)) ∧ (∀(count : ℤ), (0 : ℤ) ≤ count ∧ Square.sqr count ≤ x → (if Square.sqr (count + (1 : ℤ)) ≤ x then ((0 : ℤ) ≤ x - count ∧ x - (count + (1 : ℤ)) < x - count) ∧ (0 : ℤ) ≤ count + (1 : ℤ) ∧ Square.sqr (count + (1 : ℤ)) ≤ x ∧ Square.sqr (count + (1 : ℤ)) + ((2 : ℤ) * (count + (1 : ℤ)) + (1 : ℤ)) = Square.sqr (count + (1 : ℤ) + (1 : ℤ)) else Square.isqrt_spec x count))
  := sorry
end isqrt_Simple_isqrtqtvc
