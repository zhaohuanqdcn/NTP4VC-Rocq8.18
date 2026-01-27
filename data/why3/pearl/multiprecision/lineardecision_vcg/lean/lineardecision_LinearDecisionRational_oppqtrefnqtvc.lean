import Why3.Base
import Why3.why3.Ref.Ref
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionRational_oppqtrefnqtvc
axiom sub_def (a1 : ℝ) (a2 : ℝ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℝ) : RationalCoeffs.rinterp ((0 : ℤ), (1 : ℤ)) y = (0 : ℝ)
axiom one_def (y : ℤ -> ℝ) : RationalCoeffs.rinterp ((1 : ℤ), (1 : ℤ)) y = (1 : ℝ)
theorem opp'refn'vc : True
  := sorry
end lineardecision_LinearDecisionRational_oppqtrefnqtvc
