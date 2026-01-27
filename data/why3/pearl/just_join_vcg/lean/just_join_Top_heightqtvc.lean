import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_heightqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom lt : elt -> elt -> Prop
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : lt x y) (fact1 : lt y z) : lt x z
axiom Asymm (x : elt) (y : elt) (fact0 : lt x y) : ¬lt y x
axiom Trichotomy (x : elt) (y : elt) : lt x y ∨ lt y x ∨ x = y
inductive tree where
  | E : tree
  | N : ℤ -> tree -> elt -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def ht (t : tree) := match t with | tree.E => (0 : ℤ) | tree.N h _ _ _ => h
noncomputable def node (l : tree) (x : elt) (r : tree) := tree.N ((1 : ℤ) + max (ht l) (ht r)) l x r
theorem height'vc (t : tree) : (match t with | tree.E => True | tree.N _ l _ r => True) ∧ (∀(result : ℤ), (match t with | tree.E => result = (0 : ℤ) | tree.N _ l _ r => (∃(o1 : ℤ), (0 : ℤ) ≤ o1 ∧ (∃(o2 : ℤ), (0 : ℤ) ≤ o2 ∧ result = (1 : ℤ) + max o2 o1))) → (0 : ℤ) ≤ result)
  := sorry
end just_join_Top_heightqtvc
