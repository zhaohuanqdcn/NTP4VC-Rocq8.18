import Why3.Base
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_prod_compat_eqqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem prod_compat_eq'vc (c : ℝ) (a : ℝ) (b : ℝ) (fact0 : ¬c = (0 : ℝ)) (fact1 : a * c = b * c) : a = b
  := sorry
end lineardecision_RationalCoeffs_prod_compat_eqqtvc
