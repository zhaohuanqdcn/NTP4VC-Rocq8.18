import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_splitqtvc
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
theorem split'vc (t : tree) (y : elt) (fact0 : wf t) (fact1 : bst t) (fact2 : avl t) : (match t with | tree.E => True | tree.N _ l x r => ¬y = x → (if lt y x then (((0 : ℤ) ≤ height t ∧ height l < height t) ∧ wf l ∧ bst l ∧ avl l) ∧ (∀(ll : tree) (b : Bool) (lr : tree), (wf ll ∧ bst ll ∧ avl ll) ∧ tree_lt ll y ∧ (wf lr ∧ bst lr ∧ avl lr) ∧ lt_tree y lr ∧ (∀(x1 : elt), mem x1 l = (mem x1 ll ∨ mem x1 lr ∨ b = true ∧ x1 = y)) → (wf lr ∧ wf r) ∧ (bst lr ∧ tree_lt lr x) ∧ (bst r ∧ lt_tree x r) ∧ avl lr ∧ avl r) else (((0 : ℤ) ≤ height t ∧ height r < height t) ∧ wf r ∧ bst r ∧ avl r) ∧ (∀(rl : tree) (b : Bool) (rr : tree), (wf rl ∧ bst rl ∧ avl rl) ∧ tree_lt rl y ∧ (wf rr ∧ bst rr ∧ avl rr) ∧ lt_tree y rr ∧ (∀(x1 : elt), mem x1 r = (mem x1 rl ∨ mem x1 rr ∨ b = true ∧ x1 = y)) → (wf l ∧ wf rl) ∧ (bst l ∧ tree_lt l x) ∧ (bst rl ∧ lt_tree x rl) ∧ avl l ∧ avl rl))) ∧ (∀(l : tree) (b : Bool) (r : tree), (match t with | tree.E => l = tree.E ∧ b = false ∧ r = tree.E | tree.N _ l1 x r1 => (if y = x then l = l1 ∧ b = true ∧ r = r1 else if lt y x then ∃(r2 : tree), ((wf l ∧ bst l ∧ avl l) ∧ tree_lt l y ∧ (wf r2 ∧ bst r2 ∧ avl r2) ∧ lt_tree y r2 ∧ (∀(x1 : elt), mem x1 l1 = (mem x1 l ∨ mem x1 r2 ∨ b = true ∧ x1 = y))) ∧ wf r ∧ bst r ∧ (∀(y1 : elt), mem y1 r = (mem y1 r2 ∨ y1 = x ∨ mem y1 r1)) ∧ avl r ∧ height r ≤ (1 : ℤ) + max (height r2) (height r1) else ∃(l2 : tree), ((wf l2 ∧ bst l2 ∧ avl l2) ∧ tree_lt l2 y ∧ (wf r ∧ bst r ∧ avl r) ∧ lt_tree y r ∧ (∀(x1 : elt), mem x1 r1 = (mem x1 l2 ∨ mem x1 r ∨ b = true ∧ x1 = y))) ∧ wf l ∧ bst l ∧ (∀(y1 : elt), mem y1 l = (mem y1 l1 ∨ y1 = x ∨ mem y1 l2)) ∧ avl l ∧ height l ≤ (1 : ℤ) + max (height l1) (height l2))) → (wf l ∧ bst l ∧ avl l) ∧ tree_lt l y ∧ (wf r ∧ bst r ∧ avl r) ∧ lt_tree y r ∧ (∀(x : elt), mem x t = (mem x l ∨ mem x r ∨ b = true ∧ x = y)))
  := sorry
end just_join_Top_splitqtvc
