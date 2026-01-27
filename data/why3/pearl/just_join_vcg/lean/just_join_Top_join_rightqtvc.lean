import Why3.Base
open Classical
open Lean4Why3
namespace just_join_Top_join_rightqtvc
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
theorem join_right'vc (l : tree) (r : tree) (x : elt) (fact0 : wf l) (fact1 : wf r) (fact2 : bst l) (fact3 : tree_lt l x) (fact4 : bst r) (fact5 : lt_tree x r) (fact6 : height r + (2 : ℤ) ≤ height l) (fact7 : avl l) (fact8 : avl r) : (match l with | tree.N _ ll lx lr => (if ht lr ≤ ht r + (1 : ℤ) then let t : tree := node lr x r; ¬ht t ≤ ht ll + (1 : ℤ) → (wf t ∧ bst t ∧ (match t with | tree.N _ (tree.N _ _ _ _) _ _ => True | _ => False)) ∧ (∀(o1 : tree), wf o1 ∧ bst o1 ∧ (match t with | tree.N _ (tree.N _ a x1 b) y c => (match o1 with | tree.N _ ra rx (tree.N _ rb ry rc) => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False) | _ => False) → (let o2 : tree := node ll lx o1; wf o2 ∧ bst o2 ∧ (match o2 with | tree.N _ _ _ (tree.N _ _ _ _) => True | _ => False))) else (((0 : ℤ) ≤ height l ∧ height lr < height l) ∧ (wf lr ∧ wf r) ∧ (bst lr ∧ tree_lt lr x) ∧ (bst r ∧ lt_tree x r) ∧ height r + (2 : ℤ) ≤ height lr ∧ avl lr ∧ avl r) ∧ (∀(t : tree), wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y lr ∨ y = x ∨ mem y r)) ∧ avl t ∧ (height t = height lr ∨ height t = height lr + (1 : ℤ) ∧ (match t with | tree.N _ rl _ rr => height rl = height lr - (1 : ℤ) ∧ height rr = height lr | _ => False)) → (let t' : tree := node ll lx t; ¬ht t ≤ ht ll + (1 : ℤ) → wf t' ∧ bst t' ∧ (match t' with | tree.N _ _ _ (tree.N _ _ _ _) => True | _ => False)))) | tree.E => False) ∧ (∀(result : tree), (match l with | tree.N _ ll lx lr => (if ht lr ≤ ht r + (1 : ℤ) then let t : tree := node lr x r; if ht t ≤ ht ll + (1 : ℤ) then result = node ll lx t else ∃(o1 : tree), (wf o1 ∧ bst o1 ∧ (match t with | tree.N _ (tree.N _ a x1 b) y c => (match o1 with | tree.N _ ra rx (tree.N _ rb ry rc) => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False) | _ => False)) ∧ wf result ∧ bst result ∧ (match node ll lx o1 with | tree.N _ a x1 (tree.N _ b y c) => (match result with | tree.N _ (tree.N _ ra rx rb) ry rc => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False) | _ => False) else ∃(t : tree), (wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y lr ∨ y = x ∨ mem y r)) ∧ avl t ∧ (height t = height lr ∨ height t = height lr + (1 : ℤ) ∧ (match t with | tree.N _ rl _ rr => height rl = height lr - (1 : ℤ) ∧ height rr = height lr | _ => False))) ∧ (let t' : tree := node ll lx t; if ht t ≤ ht ll + (1 : ℤ) then result = t' else wf result ∧ bst result ∧ (match t' with | tree.N _ a x1 (tree.N _ b y c) => (match result with | tree.N _ (tree.N _ ra rx rb) ry rc => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False) | _ => False))) | tree.E => False) → wf result ∧ bst result ∧ (∀(y : elt), mem y result = (mem y l ∨ y = x ∨ mem y r)) ∧ avl result ∧ (height result = height l ∨ height result = height l + (1 : ℤ) ∧ (match result with | tree.N _ rl _ rr => height rl = height l - (1 : ℤ) ∧ height rr = height l | _ => False)))
  := sorry
end just_join_Top_join_rightqtvc
