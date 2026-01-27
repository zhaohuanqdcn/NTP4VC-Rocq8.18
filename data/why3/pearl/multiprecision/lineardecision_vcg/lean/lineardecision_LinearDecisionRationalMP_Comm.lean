import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionRationalMP_Comm
axiom coeff : Type
axiom inhabited_axiom_coeff : Inhabited coeff
attribute [instance] inhabited_axiom_coeff
theorem Comm (x : ℝ) (y : ℝ) : x + y = y + x
  := sorry
end lineardecision_LinearDecisionRationalMP_Comm
