import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
open Classical
open Lean4Why3
namespace kleene_algebra_RelAlgebra_infix_plqtvc
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
axiom result2 : a × a -> a
axiom result3 : a -> a × a -> Bool
axiom result'def2 (p : a × a) : result2 p = (match p with | (a1, _) => a1)
axiom result'def3 (y : a) (p : a × a) : (result3 y p = true) = (match p with | (_, a2) => a2 = y)
noncomputable def pre (s : Set (a × a)) (y : a) := result2 '' Set.filter s (result3 y)
axiom pre'spec (x : a) (s : Set (a × a)) (y : a) : (x ∈ pre s y) = ((x, y) ∈ s)
theorem infix_pl'vc (x : a × a) (s1 : Set (a × a)) (s2 : Set (a × a)) : (x ∈ s1 ∪ s2) = (x ∈ s1 ∨ x ∈ s2)
  := sorry
end kleene_algebra_RelAlgebra_infix_plqtvc
