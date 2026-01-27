import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
open Classical
open Lean4Why3
namespace kleene_algebra_RelAlgebra_preqtvc
axiom a : Type
axiom inhabited_axiom_a : Inhabited a
attribute [instance] inhabited_axiom_a
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom fc : a -> a × a
axiom fc'def (a1 : a) : fc a1 = (a1, a1)
noncomputable def one := fc '' Set.univ
axiom result : a × a -> a
axiom result1 : a -> a × a -> Bool
axiom result'def (p : a × a) : result p = (match p with | (_, a2) => a2)
axiom result'def1 (x : a) (p : a × a) : (result1 x p = true) = (match p with | (a1, _) => a1 = x)
noncomputable def post (s : Set (a × a)) (x : a) := result '' Set.filter s (result1 x)
axiom post'spec (y : a) (s : Set (a × a)) (x : a) : (y ∈ post s x) = ((x, y) ∈ s)
axiom o1 : a -> a × a -> Bool
axiom o2 : a -> a × a -> Bool
axiom o3 : a × a -> a
axiom o'def (y : a) (p : a × a) : (o1 y p = true) = (match p with | (_, a2) => a2 = y)
axiom o'def1 (y : a) (p : a × a) : (o2 y p = true) = (match p with | (_, a2) => a2 = y)
axiom o'def2 (p : a × a) : o3 p = (match p with | (a1, _) => a1)
theorem pre'vc (x : a) (s : Set (a × a)) (y : a) : (x ∈ o3 '' Set.filter s (o2 y)) = ((x, y) ∈ s)
  := sorry
end kleene_algebra_RelAlgebra_preqtvc
