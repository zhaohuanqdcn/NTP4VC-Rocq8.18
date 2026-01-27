import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionIntMP_addqtrefnqtvc
inductive t where
  | I : ℤ -> t
  | E : MP64Coeffs.exp -> t
  | R : t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def mpinterp (t1 : t) (y : ℤ -> ℤ) := match t1 with | t.I n => n | t.E e => HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (MP64Coeffs.interp_exp e y)) | t.R => (18446744073709551615 : ℤ) + (1 : ℤ)
axiom mpeq'spec : True
axiom sub_def (a1 : ℤ) (a2 : ℤ) : a1 - a2 = a1 + -a2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
axiom zero_def (y : ℤ -> ℤ) : mpinterp (t.I (0 : ℤ)) y = (0 : ℤ)
axiom one_def (y : ℤ -> ℤ) : mpinterp (t.I (1 : ℤ)) y = (1 : ℤ)
theorem add'refn'vc : True
  := sorry
end lineardecision_LinearDecisionIntMP_addqtrefnqtvc
