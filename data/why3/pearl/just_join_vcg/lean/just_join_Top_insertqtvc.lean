import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_insertqtvc
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
noncomputable def height : tree -> ℤ
  | tree.E => (0 : ℤ)
  | (tree.N x l x0 r) => (1 : ℤ) + max (height l) (height r)
axiom height'spec (t : tree) : (0 : ℤ) ≤ height t
noncomputable def wf : tree -> Prop
  | tree.E => True
  | (tree.N h l x_x r) => h = height (tree.N h l x_x r) ∧ wf l ∧ wf r
noncomputable def mem : elt -> tree -> Prop
  | y, tree.E => False
  | y, (tree.N x0 l x r) => mem y l ∨ y = x ∨ mem y r
noncomputable def tree_lt (t : tree) (y : elt) := ∀(x : elt), mem x t → lt x y
noncomputable def lt_tree (y : elt) (t : tree) := ∀(x : elt), mem x t → lt y x
noncomputable def bst : tree -> Prop
  | tree.E => True
  | (tree.N x0 l x r) => bst l ∧ tree_lt l x ∧ bst r ∧ lt_tree x r
noncomputable def avl : tree -> Prop
  | tree.E => True
  | (tree.N x l x0 r) => avl l ∧ avl r ∧ -(1 : ℤ) ≤ height l - height r ∧ height l - height r ≤ (1 : ℤ)
theorem insert'vc (t : tree) (x : elt) (fact0 : wf t) (fact1 : bst t) (fact2 : avl t) : wf t ∧ bst t ∧ avl t ∧ (∀(l : tree) (o1 : Bool) (r : tree), (wf l ∧ bst l ∧ avl l) ∧ tree_lt l x ∧ (wf r ∧ bst r ∧ avl r) ∧ lt_tree x r ∧ (∀(x1 : elt), mem x1 t = (mem x1 l ∨ mem x1 r ∨ o1 = true ∧ x1 = x)) → ((wf l ∧ wf r) ∧ (bst l ∧ tree_lt l x) ∧ (bst r ∧ lt_tree x r) ∧ avl l ∧ avl r) ∧ (∀(r1 : tree), wf r1 ∧ bst r1 ∧ (∀(y : elt), mem y r1 = (mem y l ∨ y = x ∨ mem y r)) ∧ avl r1 ∧ height r1 ≤ (1 : ℤ) + max (height l) (height r) → (wf r1 ∧ bst r1 ∧ avl r1) ∧ (∀(y : elt), mem y r1 = (mem y t ∨ y = x))))
  := sorry
end just_join_Top_insertqtvc
