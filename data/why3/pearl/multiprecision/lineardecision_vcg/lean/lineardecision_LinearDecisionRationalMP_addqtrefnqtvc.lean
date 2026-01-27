import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionRationalMP_addqtrefnqtvc
axiom coeff : Type
axiom inhabited_axiom_coeff : Inhabited coeff
attribute [instance] inhabited_axiom_coeff
axiom sub_def (a1 : ℝ) (a2 : ℝ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℤ) : MP64Coeffs.minterp (((0 : ℤ), (1 : ℤ)), MP64Coeffs.exp.Lit (0 : ℤ)) y = (0 : ℝ)
axiom one_def (y : ℤ -> ℤ) : MP64Coeffs.minterp (((1 : ℤ), (1 : ℤ)), MP64Coeffs.exp.Lit (0 : ℤ)) y = (1 : ℝ)
theorem add'refn'vc : True
  := sorry
end lineardecision_LinearDecisionRationalMP_addqtrefnqtvc
