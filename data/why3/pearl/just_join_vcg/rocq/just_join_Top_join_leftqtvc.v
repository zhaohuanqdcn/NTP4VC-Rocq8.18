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
Theorem join_left'vc (l : tree) (r : tree) (x : elt) (fact0 : wf l) (fact1 : wf r) (fact2 : bst l) (fact3 : tree_lt l x) (fact4 : bst r) (fact5 : lt_tree x r) (fact6 : height l + 2%Z ≤ height r) (fact7 : avl l) (fact8 : avl r) : (match r with | N _ rl rx rr => (if decide (ht rl ≤ ht l + 1%Z) then let t : tree := node l x rl in ¬ ht t ≤ ht rr + 1%Z -> (wf t ∧ bst t ∧ (match t with | N _ _ _ (N _ _ _ _) => True | _ => False end)) ∧ (∀(o1 : tree), wf o1 ∧ bst o1 ∧ (match t with | N _ a x1 (N _ b y c) => (match o1 with | N _ (N _ ra rx1 rb) ry rc => ra = a ∧ rx1 = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end) -> (let o2 : tree := node o1 rx rr in wf o2 ∧ bst o2 ∧ (match o2 with | N _ (N _ _ _ _) _ _ => True | _ => False end))) else ((0%Z ≤ height r ∧ height rl < height r) ∧ (wf l ∧ wf rl) ∧ (bst l ∧ tree_lt l x) ∧ (bst rl ∧ lt_tree x rl) ∧ height l + 2%Z ≤ height rl ∧ avl l ∧ avl rl) ∧ (∀(t : tree), wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y l ∨ y = x ∨ mem y rl)) ∧ avl t ∧ (height t = height rl ∨ height t = height rl + 1%Z ∧ (match t with | N _ rl1 _ rr1 => height rr1 = height rl - 1%Z ∧ height rl1 = height rl | _ => False end)) -> (let t' : tree := node t rx rr in ¬ ht t ≤ ht rr + 1%Z -> wf t' ∧ bst t' ∧ (match t' with | N _ (N _ _ _ _) _ _ => True | _ => False end)))) | E => False end) ∧ (∀(result : tree), (match r with | N _ rl rx rr => (if decide (ht rl ≤ ht l + 1%Z) then let t : tree := node l x rl in if decide (ht t ≤ ht rr + 1%Z) then result = node t rx rr else ∃(o1 : tree), (wf o1 ∧ bst o1 ∧ (match t with | N _ a x1 (N _ b y c) => (match o1 with | N _ (N _ ra rx1 rb) ry rc => ra = a ∧ rx1 = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end)) ∧ wf result ∧ bst result ∧ (match node o1 rx rr with | N _ (N _ a x1 b) y c => (match result with | N _ ra rx1 (N _ rb ry rc) => ra = a ∧ rx1 = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end) else ∃(t : tree), (wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y l ∨ y = x ∨ mem y rl)) ∧ avl t ∧ (height t = height rl ∨ height t = height rl + 1%Z ∧ (match t with | N _ rl1 _ rr1 => height rr1 = height rl - 1%Z ∧ height rl1 = height rl | _ => False end))) ∧ (let t' : tree := node t rx rr in if decide (ht t ≤ ht rr + 1%Z) then result = t' else wf result ∧ bst result ∧ (match t' with | N _ (N _ a x1 b) y c => (match result with | N _ ra rx1 (N _ rb ry rc) => ra = a ∧ rx1 = x1 ∧ rb = b ∧ ry = y ∧ rc = c | _ => False end) | _ => False end))) | E => False end) -> wf result ∧ bst result ∧ (∀(y : elt), mem y result = (mem y l ∨ y = x ∨ mem y r)) ∧ avl result ∧ (height result = height r ∨ height result = height r + 1%Z ∧ (match result with | N _ rl _ rr => height rr = height r - 1%Z ∧ height rl = height r | _ => False end))).
Proof.
Admitted.
