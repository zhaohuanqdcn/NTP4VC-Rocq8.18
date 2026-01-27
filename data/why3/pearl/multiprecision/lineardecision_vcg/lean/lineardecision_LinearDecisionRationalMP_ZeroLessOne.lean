import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionRationalMP_ZeroLessOne
axiom coeff : Type
axiom inhabited_axiom_coeff : Inhabited coeff
attribute [instance] inhabited_axiom_coeff
theorem ZeroLessOne : (0 : ℝ) ≤ (1 : ℝ)
  := sorry
end lineardecision_LinearDecisionRationalMP_ZeroLessOne
