import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_split_lastqtvc
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
theorem split_last'vc (t : tree) (fact0 : ¬t = tree.E) (fact1 : wf t) (fact2 : bst t) (fact3 : avl t) : (match t with | tree.N _ l x tree.E => True | tree.N _ l x r => (((0 : ℤ) ≤ height t ∧ height r < height t) ∧ ¬r = tree.E ∧ wf r ∧ bst r ∧ avl r) ∧ (∀(r' : tree) (m : elt), (wf r' ∧ bst r' ∧ avl r') ∧ (∀(x1 : elt), mem x1 r = (mem x1 r' ∧ lt x1 m ∨ x1 = m)) ∧ tree_lt r' m → (wf l ∧ wf r') ∧ (bst l ∧ tree_lt l x) ∧ (bst r' ∧ lt_tree x r') ∧ avl l ∧ avl r') | _ => False) ∧ (∀(r : tree) (m : elt), (match t with | tree.N _ l x tree.E => r = l ∧ m = x | tree.N _ l x r1 => (∃(r2 : tree), ((wf r2 ∧ bst r2 ∧ avl r2) ∧ (∀(x1 : elt), mem x1 r1 = (mem x1 r2 ∧ lt x1 m ∨ x1 = m)) ∧ tree_lt r2 m) ∧ wf r ∧ bst r ∧ (∀(y : elt), mem y r = (mem y l ∨ y = x ∨ mem y r2)) ∧ avl r ∧ height r ≤ (1 : ℤ) + max (height l) (height r2)) | _ => False) → (wf r ∧ bst r ∧ avl r) ∧ (∀(x : elt), mem x t = (mem x r ∧ lt x m ∨ x = m)) ∧ tree_lt r m)
  := sorry
end just_join_Top_split_lastqtvc
