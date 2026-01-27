import Why3.Base
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_cross_dqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem cross_d'vc (d1 : ℤ) (d2 : ℤ) (n1 : ℤ) (n2 : ℤ) (v : ℤ -> ℝ) (fact0 : ¬d1 = (0 : ℤ)) (fact1 : ¬d2 = (0 : ℤ)) (fact2 : n1 * d2 = n2 * d1) : rinterp (n1, d1) v = rinterp (n2, d2) v
  := sorry
end lineardecision_RationalCoeffs_cross_dqtvc
