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
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Inductive tree :=
  | tree'mk : elt -> list tree -> Z -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Definition elem (x : tree) := match x with |  tree'mk a _ _ => a end.
Definition children (x : tree) := match x with |  tree'mk _ a _ => a end.
Definition rank (x : tree) := match x with |  tree'mk _ _ a => a end.
Axiom size : list tree -> Z.
Axiom size_def : forall (l : list tree), size l = (match l with | [] => 0%Z | cons (tree'mk _ c _) r => 1%Z + size c + size r end).
Axiom le_roots : elt -> list tree -> Prop.
Axiom le_roots_def : forall (e : elt) (l : list tree), le_roots e l = (match l with | [] => True | cons t r => le e (elem t) ∧ le_roots e r end).
Axiom heaps : list tree -> Prop.
Axiom heaps_def : forall (l : list tree), heaps l = (match l with | [] => True | cons (tree'mk e c _) r => le_roots e c ∧ heaps c ∧ heaps r end).
Axiom occ : elt -> list tree -> Z.
Axiom occ_def : forall (x : elt) (l : list tree), occ x l = (match l with | [] => 0%Z | cons (tree'mk y c _) r => (if decide (x = y) then 1%Z else 0%Z) + occ x c + occ x r end).
Definition mem (x : elt) (l : list tree) := 0%Z < occ x l.
Axiom has_order : Z -> list tree -> Prop.
Axiom has_order_def : forall (k : Z) (l : list tree), has_order k l = (match l with | [] => k = 0%Z | cons (tree'mk _ c k') r => k' = k - 1%Z ∧ has_order (k - 1%Z) c ∧ has_order (k - 1%Z) r end).
Definition binomial_tree (t : tree) := rank t = Z.of_nat (length (children t)) ∧ has_order (rank t) (children t).
Theorem has_order_length'vc (k : Z) (l : list tree) (fact0 : has_order k l) : Z.of_nat (length l) = k.
Proof.
Admitted.
