import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
open Classical
open Lean4Why3
namespace kleene_algebra_RelAlgebra_one_defqtvc
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom fc : a -> a × a
axiom fc'def (a1 : a) : fc a1 = (a1, a1)
noncomputable def one := fc '' Set.univ
theorem one_def'vc (x : a) : (x, x) ∈ one
  := sorry
end kleene_algebra_RelAlgebra_one_defqtvc
