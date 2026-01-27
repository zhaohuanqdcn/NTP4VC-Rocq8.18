import Why3.Base
import Why3.why3.Ref.Ref
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionRational_CompatOrderMult
theorem CompatOrderMult (x : ℝ) (y : ℝ) (z : ℝ) (fact0 : x ≤ y) (fact1 : (0 : ℝ) ≤ z) : x * z ≤ y * z
  := sorry
end lineardecision_LinearDecisionRational_CompatOrderMult
