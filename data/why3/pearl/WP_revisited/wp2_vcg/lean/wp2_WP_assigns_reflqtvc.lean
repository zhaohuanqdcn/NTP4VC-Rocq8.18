import Why3.Base
import pearl.WP_revisited.lib.lean.wp2.Imp
open Classical
open Lean4Why3
namespace wp2_WP_assigns_reflqtvc
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset ℤ
axiom mk : Finset ℤ -> set
axiom mk'spec (s : Finset ℤ) : to_fset (mk s) = s
axiom choose1 : set -> ℤ
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
noncomputable def assigns (sigma : ℤ -> Imp.value) (a : Finset ℤ) (sigma' : ℤ -> Imp.value) := ∀(i : ℤ), ¬i ∈ a → sigma i = sigma' i
theorem assigns_refl'vc (sigma : ℤ -> Imp.value) (a : Finset ℤ) : assigns sigma a sigma
  := sorry
end wp2_WP_assigns_reflqtvc
