import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_rmulqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem rmul'vc (a : ℤ) (o1 : Bool) (b : ℤ) (a1 : ℤ) (b1 : ℤ) (y : ℤ -> ℝ) (fact0 : if a = (0 : ℤ) then o1 = true else o1 = (if b = (0 : ℤ) then true else false)) (fact1 : ¬o1 = true) : rinterp (a1 * b1, a * b) y = rinterp (a1, a) y * rinterp (b1, b) y
  := sorry
end lineardecision_RationalCoeffs_rmulqtvc
