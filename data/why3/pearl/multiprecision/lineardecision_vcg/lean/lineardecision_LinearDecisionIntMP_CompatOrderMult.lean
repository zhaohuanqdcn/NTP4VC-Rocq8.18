import Why3.Base
import Why3.why3.Ref.Ref
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
open Classical
open Lean4Why3
namespace lineardecision_LinearDecisionIntMP_CompatOrderMult
inductive t where
  | I : ℤ -> t
  | E : MP64Coeffs.exp -> t
  | R : t
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def mpinterp (t1 : t) (y : ℤ -> ℤ) := match t1 with | t.I n => n | t.E e => HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (MP64Coeffs.interp_exp e y)) | t.R => (18446744073709551615 : ℤ) + (1 : ℤ)
axiom mpeq'spec : True
theorem CompatOrderMult (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x ≤ y) (fact1 : (0 : ℤ) ≤ z) : x * z ≤ y * z
  := sorry
end lineardecision_LinearDecisionIntMP_CompatOrderMult
