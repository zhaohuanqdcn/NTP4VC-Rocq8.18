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
Theorem split'vc (t : tree) (y : elt) (fact0 : wf t) (fact1 : bst t) (fact2 : avl t) : (match t with | E => True | N _ l x r => ¬ y = x -> (if decide (lt y x) then ((0%Z ≤ height t ∧ height l < height t) ∧ wf l ∧ bst l ∧ avl l) ∧ (∀(ll : tree) (b : bool) (lr : tree), (wf ll ∧ bst ll ∧ avl ll) ∧ tree_lt ll y ∧ (wf lr ∧ bst lr ∧ avl lr) ∧ lt_tree y lr ∧ (∀(x1 : elt), mem x1 l = (mem x1 ll ∨ mem x1 lr ∨ b = true ∧ x1 = y)) -> (wf lr ∧ wf r) ∧ (bst lr ∧ tree_lt lr x) ∧ (bst r ∧ lt_tree x r) ∧ avl lr ∧ avl r) else ((0%Z ≤ height t ∧ height r < height t) ∧ wf r ∧ bst r ∧ avl r) ∧ (∀(rl : tree) (b : bool) (rr : tree), (wf rl ∧ bst rl ∧ avl rl) ∧ tree_lt rl y ∧ (wf rr ∧ bst rr ∧ avl rr) ∧ lt_tree y rr ∧ (∀(x1 : elt), mem x1 r = (mem x1 rl ∨ mem x1 rr ∨ b = true ∧ x1 = y)) -> (wf l ∧ wf rl) ∧ (bst l ∧ tree_lt l x) ∧ (bst rl ∧ lt_tree x rl) ∧ avl l ∧ avl rl)) end) ∧ (∀(l : tree) (b : bool) (r : tree), (match t with | E => l = E ∧ b = false ∧ r = E | N _ l1 x r1 => (if decide (y = x) then l = l1 ∧ b = true ∧ r = r1 else if decide (lt y x) then ∃(r2 : tree), ((wf l ∧ bst l ∧ avl l) ∧ tree_lt l y ∧ (wf r2 ∧ bst r2 ∧ avl r2) ∧ lt_tree y r2 ∧ (∀(x1 : elt), mem x1 l1 = (mem x1 l ∨ mem x1 r2 ∨ b = true ∧ x1 = y))) ∧ wf r ∧ bst r ∧ (∀(y1 : elt), mem y1 r = (mem y1 r2 ∨ y1 = x ∨ mem y1 r1)) ∧ avl r ∧ height r ≤ 1%Z + Z.max (height r2) (height r1) else ∃(l2 : tree), ((wf l2 ∧ bst l2 ∧ avl l2) ∧ tree_lt l2 y ∧ (wf r ∧ bst r ∧ avl r) ∧ lt_tree y r ∧ (∀(x1 : elt), mem x1 r1 = (mem x1 l2 ∨ mem x1 r ∨ b = true ∧ x1 = y))) ∧ wf l ∧ bst l ∧ (∀(y1 : elt), mem y1 l = (mem y1 l1 ∨ y1 = x ∨ mem y1 l2)) ∧ avl l ∧ height l ≤ 1%Z + Z.max (height l1) (height l2)) end) -> (wf l ∧ bst l ∧ avl l) ∧ tree_lt l y ∧ (wf r ∧ bst r ∧ avl r) ∧ lt_tree y r ∧ (∀(x : elt), mem x t = (mem x l ∨ mem x r ∨ b = true ∧ x = y))).
Admitted.
