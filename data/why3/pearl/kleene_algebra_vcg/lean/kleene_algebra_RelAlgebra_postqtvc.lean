import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
open Classical
open Lean4Why3
namespace kleene_algebra_RelAlgebra_postqtvc
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom fc : a -> a × a
axiom fc'def (a1 : a) : fc a1 = (a1, a1)
noncomputable def one := fc '' Set.univ
axiom o1 : a -> a × a -> Bool
axiom o2 : a -> a × a -> Bool
axiom o3 : a × a -> a
axiom o'def (x : a) (p : a × a) : (o1 x p = true) = (match p with | (a1, _) => a1 = x)
axiom o'def1 (x : a) (p : a × a) : (o2 x p = true) = (match p with | (a1, _) => a1 = x)
axiom o'def2 (p : a × a) : o3 p = (match p with | (_, a2) => a2)
theorem post'vc (y : a) (s : Set (a × a)) (x : a) : (y ∈ o3 '' Set.filter s (o2 x)) = ((x, y) ∈ s)
  := sorry
end kleene_algebra_RelAlgebra_postqtvc
