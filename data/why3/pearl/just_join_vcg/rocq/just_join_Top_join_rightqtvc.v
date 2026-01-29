From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom lt : elt -> elt -> Prop.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : lt x y) (fact1 : lt y z), lt x z.
Axiom Asymm : forall  (x : elt) (y : elt) (fact0 : lt x y), ¬ lt y x.
Axiom Trichotomy : forall  (x : elt) (y : elt), lt x y ∨ lt y x ∨ x = y.
Inductive tree :=
  | E : tree
  | N : Z -> tree -> elt -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Definition ht (t : tree) : Z := match t with | E => 0%Z | N h _ _ _ => h end.
Definition node (l : tree) (x : elt) (r : tree) : tree := N (1%Z + Z.max (ht l) (ht r)) l x r.
Program Fixpoint height (t : tree) : Z :=
match t with | E => 0%Z | N _ l _ r => 1%Z + Z.max (height l) (height r) end.
Admit Obligations.
Axiom height'spec : forall  (t : tree), 0%Z ≤ height t.
Program Fixpoint wf (t : tree) : Prop :=
match t with | E => True | N h l x_x r => h = height t ∧ wf l ∧ wf r end.
Admit Obligations.
Program Fixpoint mem (y : elt) (t : tree) : Prop :=
match t with | E => False | N _ l x r => mem y l ∨ y = x ∨ mem y r end.
Admit Obligations.
Definition tree_lt (t : tree) (y : elt) := ∀(x : elt), mem x t -> lt x y.
Definition lt_tree (y : elt) (t : tree) := ∀(x : elt), mem x t -> lt y x.
Program Fixpoint bst (t : tree) : Prop :=
match t with | E => True | N _ l x r => bst l ∧ tree_lt l x ∧ bst r ∧ lt_tree x r end.
Admit Obligations.
Program Fixpoint avl (t : tree) : Prop :=
match t with | E => True | N _ l _ r => avl l ∧ avl r ∧ - 1%Z ≤ height l - height r ∧ height l - height r ≤ 1%Z end.
Admit Obligations.
Theorem join_right'vc (l : tree) (r : tree) (x : elt) (fact0 : wf l) (fact1 : wf r) (fact2 : bst l) (fact3 : tree_lt l x) (fact4 : bst r) (fact5 : lt_tree x r) (fact6 : height r + 2%Z ≤ height l) (fact7 : avl l) (fact8 : avl r) : (match l with | N _ ll lx lr => (if decide (ht lr ≤ ht r + 1%Z) then let t : tree := node lr x r in ¬ ht t ≤ ht ll + 1%Z -> (wf t ∧ bst t ∧ (match t with | N _ (N _ _ _ _) _ _ => True | _ => False end)) ∧ (∀(o1 : tree), wf o1 ∧ bst o1 ∧ (match t with | N _ (N _ a x1 b) y c => (match o1 with | N _ ra rx (N _ rb ry rc) => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end) -> (let o2 : tree := node ll lx o1 in wf o2 ∧ bst o2 ∧ (match o2 with | N _ _ _ (N _ _ _ _) => True | _ => False end))) else ((0%Z ≤ height l ∧ height lr < height l) ∧ (wf lr ∧ wf r) ∧ (bst lr ∧ tree_lt lr x) ∧ (bst r ∧ lt_tree x r) ∧ height r + 2%Z ≤ height lr ∧ avl lr ∧ avl r) ∧ (∀(t : tree), wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y lr ∨ y = x ∨ mem y r)) ∧ avl t ∧ (height t = height lr ∨ height t = height lr + 1%Z ∧ (match t with | N _ rl _ rr => height rl = height lr - 1%Z ∧ height rr = height lr | _ => False end)) -> (let t' : tree := node ll lx t in ¬ ht t ≤ ht ll + 1%Z -> wf t' ∧ bst t' ∧ (match t' with | N _ _ _ (N _ _ _ _) => True | _ => False end)))) | E => False end) ∧ (∀(result : tree), (match l with | N _ ll lx lr => (if decide (ht lr ≤ ht r + 1%Z) then let t : tree := node lr x r in if decide (ht t ≤ ht ll + 1%Z) then result = node ll lx t else ∃(o1 : tree), (wf o1 ∧ bst o1 ∧ (match t with | N _ (N _ a x1 b) y c => (match o1 with | N _ ra rx (N _ rb ry rc) => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end)) ∧ wf result ∧ bst result ∧ (match node ll lx o1 with | N _ a x1 (N _ b y c) => (match result with | N _ (N _ ra rx rb) ry rc => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end) else ∃(t : tree), (wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y lr ∨ y = x ∨ mem y r)) ∧ avl t ∧ (height t = height lr ∨ height t = height lr + 1%Z ∧ (match t with | N _ rl _ rr => height rl = height lr - 1%Z ∧ height rr = height lr | _ => False end))) ∧ (let t' : tree := node ll lx t in if decide (ht t ≤ ht ll + 1%Z) then result = t' else wf result ∧ bst result ∧ (match t' with | N _ a x1 (N _ b y c) => (match result with | N _ (N _ ra rx rb) ry rc => ra = a ∧ rx = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end))) | E => False end) -> wf result ∧ bst result ∧ (∀(y : elt), mem y result = (mem y l ∨ y = x ∨ mem y r)) ∧ avl result ∧ (height result = height l ∨ height result = height l + 1%Z ∧ (match result with | N _ rl _ rr => height rl = height l - 1%Z ∧ height rr = height l | _ => False end))).
Proof.
Admitted.
