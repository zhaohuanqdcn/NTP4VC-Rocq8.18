From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
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
Theorem split_last'vc (t : tree) (fact0 : ¬ t = E) (fact1 : wf t) (fact2 : bst t) (fact3 : avl t) : (match t with | N _ l x E => True | N _ l x r => ((0%Z ≤ height t ∧ height r < height t) ∧ ¬ r = E ∧ wf r ∧ bst r ∧ avl r) ∧ (∀(r' : tree) (m : elt), (wf r' ∧ bst r' ∧ avl r') ∧ (∀(x1 : elt), mem x1 r = (mem x1 r' ∧ lt x1 m ∨ x1 = m)) ∧ tree_lt r' m -> (wf l ∧ wf r') ∧ (bst l ∧ tree_lt l x) ∧ (bst r' ∧ lt_tree x r') ∧ avl l ∧ avl r') | _ => False end) ∧ (∀(r : tree) (m : elt), (match t with | N _ l x E => r = l ∧ m = x | N _ l x r1 => (∃(r2 : tree), ((wf r2 ∧ bst r2 ∧ avl r2) ∧ (∀(x1 : elt), mem x1 r1 = (mem x1 r2 ∧ lt x1 m ∨ x1 = m)) ∧ tree_lt r2 m) ∧ wf r ∧ bst r ∧ (∀(y : elt), mem y r = (mem y l ∨ y = x ∨ mem y r2)) ∧ avl r ∧ height r ≤ 1%Z + Z.max (height l) (height r2)) | _ => False end) -> (wf r ∧ bst r ∧ avl r) ∧ (∀(x : elt), mem x t = (mem x r ∧ lt x m ∨ x = m)) ∧ tree_lt r m).
Admitted.
