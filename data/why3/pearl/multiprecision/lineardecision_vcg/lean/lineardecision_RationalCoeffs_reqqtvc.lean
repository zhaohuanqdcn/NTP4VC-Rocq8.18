import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace lineardecision_RationalCoeffs_reqqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom rvars : Type
axiom inhabited_axiom_rvars : Inhabited rvars
attribute [instance] inhabited_axiom_rvars
noncomputable def rinterp (t1 : ℤ × ℤ) (x_v : ℤ -> ℝ) := match t1 with | (n, d) => Int.to_Real n / Int.to_Real d
theorem req'vc (a : ℤ) (b : ℤ) (a1 : ℤ) (b1 : ℤ) (y : ℤ -> ℝ) (fact0 : ∃(o1 : Bool), (if a = b then o1 = (if a1 = b1 then true else false) else o1 = false) ∧ (if o1 = true then True else if ¬a1 = (0 : ℤ) then if ¬b1 = (0 : ℤ) then true = (if a * b1 = b * a1 then true else false) else true = false else true = false)) : rinterp (a, a1) y = rinterp (b, b1) y
  := sorry
end lineardecision_RationalCoeffs_reqqtvc
