import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
open Classical
open Lean4Why3
namespace kleene_algebra_RelAlgebra_zero_defqtvc
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
theorem zero_def'vc (x : a) (x1 : a) : ¬(x, x1) ∈ (∅ : Set (a × a))
  := sorry
end kleene_algebra_RelAlgebra_zero_defqtvc
