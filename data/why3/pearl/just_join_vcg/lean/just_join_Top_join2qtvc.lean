import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_join2qtvc
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
theorem join2'vc (l : tree) (r : tree) (fact0 : wf l) (fact1 : bst l) (fact2 : avl l) (fact3 : wf r) (fact4 : bst r) (fact5 : avl r) (fact6 : ∀(x : elt) (y : elt), mem x l → mem y r → lt x y) : (match l with | tree.E => True | _ => (¬l = tree.E ∧ wf l ∧ bst l ∧ avl l) ∧ (∀(l1 : tree) (k : elt), (wf l1 ∧ bst l1 ∧ avl l1) ∧ (∀(x : elt), mem x l = (mem x l1 ∧ lt x k ∨ x = k)) ∧ tree_lt l1 k → (wf l1 ∧ wf r) ∧ (bst l1 ∧ tree_lt l1 k) ∧ (bst r ∧ lt_tree k r) ∧ avl l1 ∧ avl r)) ∧ (∀(t : tree), (match l with | tree.E => t = r | _ => (∃(r1 : tree) (m : elt), ((wf r1 ∧ bst r1 ∧ avl r1) ∧ (∀(x : elt), mem x l = (mem x r1 ∧ lt x m ∨ x = m)) ∧ tree_lt r1 m) ∧ wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y r1 ∨ y = m ∨ mem y r)) ∧ avl t ∧ height t ≤ (1 : ℤ) + max (height r1) (height r))) → (wf t ∧ bst t ∧ avl t) ∧ (∀(x : elt), mem x t = (mem x l ∨ mem x r)))
  := sorry
end just_join_Top_join2qtvc
