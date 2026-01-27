import Why3.Base
import Why3.why3.Ref.Ref
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionRational_invqtrefnqtvc
axiom sub_def (a1 : ℝ) (a2 : ℝ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℝ) : RationalCoeffs.rinterp ((0 : ℤ), (1 : ℤ)) y = (0 : ℝ)
axiom one_def (y : ℤ -> ℝ) : RationalCoeffs.rinterp ((1 : ℤ), (1 : ℤ)) y = (1 : ℝ)
theorem inv'refn'vc (a : ℤ) (a1 : ℤ) : let a2 : ℤ × ℤ := (a, a1); ¬RationalCoeffs.req a2 ((0 : ℤ), (1 : ℤ)) → ¬RationalCoeffs.req a2 ((0 : ℤ), (1 : ℤ)) ∧ (∀(result : ℤ) (result1 : ℤ), let result2 : ℤ × ℤ := (result, result1); ¬RationalCoeffs.req result2 ((0 : ℤ), (1 : ℤ)) ∧ (∀(y : ℤ -> ℝ), RationalCoeffs.rinterp result2 y * RationalCoeffs.rinterp a2 y = (1 : ℝ)) → ¬RationalCoeffs.req result2 ((0 : ℤ), (1 : ℤ)))
  := sorry
end lineardecision_LinearDecisionRational_invqtrefnqtvc
