import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_joinqtvc
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
theorem join'vc (l : tree) (r : tree) (x : elt) (fact0 : wf l) (fact1 : wf r) (fact2 : bst l) (fact3 : tree_lt l x) (fact4 : bst r) (fact5 : lt_tree x r) (fact6 : avl l) (fact7 : avl r) : let o1 : ℤ := ht r + (1 : ℤ); let o2 : ℤ := ht l; (if o1 < o2 then (wf l ∧ wf r) ∧ (bst l ∧ tree_lt l x) ∧ (bst r ∧ lt_tree x r) ∧ height r + (2 : ℤ) ≤ height l ∧ avl l ∧ avl r else ht l + (1 : ℤ) < ht r → (wf l ∧ wf r) ∧ (bst l ∧ tree_lt l x) ∧ (bst r ∧ lt_tree x r) ∧ height l + (2 : ℤ) ≤ height r ∧ avl l ∧ avl r) ∧ (∀(result : tree), (if o1 < o2 then wf result ∧ bst result ∧ (∀(y : elt), mem y result = (mem y l ∨ y = x ∨ mem y r)) ∧ avl result ∧ (height result = height l ∨ height result = height l + (1 : ℤ) ∧ (match result with | tree.N _ rl _ rr => height rl = height l - (1 : ℤ) ∧ height rr = height l | _ => False)) else if ht l + (1 : ℤ) < ht r then wf result ∧ bst result ∧ (∀(y : elt), mem y result = (mem y l ∨ y = x ∨ mem y r)) ∧ avl result ∧ (height result = height r ∨ height result = height r + (1 : ℤ) ∧ (match result with | tree.N _ rl _ rr => height rr = height r - (1 : ℤ) ∧ height rl = height r | _ => False)) else result = node l x r) → wf result ∧ bst result ∧ (∀(y : elt), mem y result = (mem y l ∨ y = x ∨ mem y r)) ∧ avl result ∧ height result ≤ (1 : ℤ) + max (height l) (height r))
  := sorry
end just_join_Top_joinqtvc
