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
Theorem join2'vc (l : tree) (r : tree) (fact0 : wf l) (fact1 : bst l) (fact2 : avl l) (fact3 : wf r) (fact4 : bst r) (fact5 : avl r) (fact6 : ∀(x : elt) (y : elt), mem x l -> mem y r -> lt x y) : (match l with | E => True | _ => (¬ l = E ∧ wf l ∧ bst l ∧ avl l) ∧ (∀(l1 : tree) (k : elt), (wf l1 ∧ bst l1 ∧ avl l1) ∧ (∀(x : elt), mem x l = (mem x l1 ∧ lt x k ∨ x = k)) ∧ tree_lt l1 k -> (wf l1 ∧ wf r) ∧ (bst l1 ∧ tree_lt l1 k) ∧ (bst r ∧ lt_tree k r) ∧ avl l1 ∧ avl r) end) ∧ (∀(t : tree), (match l with | E => t = r | _ => (∃(r1 : tree) (m : elt), ((wf r1 ∧ bst r1 ∧ avl r1) ∧ (∀(x : elt), mem x l = (mem x r1 ∧ lt x m ∨ x = m)) ∧ tree_lt r1 m) ∧ wf t ∧ bst t ∧ (∀(y : elt), mem y t = (mem y r1 ∨ y = m ∨ mem y r)) ∧ avl t ∧ height t ≤ 1%Z + Z.max (height r1) (height r)) end) -> (wf t ∧ bst t ∧ avl t) ∧ (∀(x : elt), mem x t = (mem x l ∨ mem x r))).
Proof.
Admitted.
