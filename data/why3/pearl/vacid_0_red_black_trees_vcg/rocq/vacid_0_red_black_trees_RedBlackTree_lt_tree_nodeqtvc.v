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
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom value : Type.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Inductive color :=
  | Red : color
  | Black : color.
Axiom color_inhabited : Inhabited color.
Global Existing Instance color_inhabited.
Axiom color_countable : Countable color.
Global Existing Instance color_countable.
Inductive tree :=
  | Leaf : tree
  | Node : color -> tree -> Z -> Z -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint memt (t : tree) (k : Z) (v : Z) : Prop :=
match t with | Leaf => False | Node _ l k' v' r => k = k' ∧ v = v' ∨ memt l k v ∨ memt r k v end.
Admit Obligations.
Definition lt_tree (x : Z) (t : tree) := ∀(k : Z) (v : Z), memt t k v -> k < x.
Definition gt_tree (x : Z) (t : tree) := ∀(k : Z) (v : Z), memt t k v -> x < k.
Theorem lt_tree_node'vc (x : Z) (l : tree) (r : tree) (y : Z) (c : color) (v : Z) (fact0 : lt_tree x l) (fact1 : lt_tree x r) (fact2 : y < x) : lt_tree x (Node c l y v r).
Proof.
Admitted.
