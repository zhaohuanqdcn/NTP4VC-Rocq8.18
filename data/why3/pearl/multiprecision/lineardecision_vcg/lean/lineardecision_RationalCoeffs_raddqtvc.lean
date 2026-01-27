import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_raddqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem radd'vc (a : ℤ) (b : ℤ) (result : ℤ) (result1 : ℤ) (a1 : ℤ) (b1 : ℤ) (fact0 : ¬(¬a = (0 : ℤ) → b = (0 : ℤ))) : let result2 : ℤ × ℤ := (result, result1); (∀(v : ℤ -> ℝ), rinterp result2 v = rinterp (a1 * b + b1 * a, a * b) v) → (∀(y : ℤ -> ℝ), rinterp result2 y = rinterp (a1, a) y + rinterp (b1, b) y)
  := sorry
end lineardecision_RationalCoeffs_raddqtvc
