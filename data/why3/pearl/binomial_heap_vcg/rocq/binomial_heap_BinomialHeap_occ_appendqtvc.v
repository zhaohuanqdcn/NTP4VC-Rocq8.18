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
Program Fixpoint size (l : list tree) : Z :=
match l with | [] => 0%Z | cons (tree'mk _ c _) r => 1%Z + size c + size r end.
Admit Obligations.
Program Fixpoint le_roots (e : elt) (l : list tree) : Prop :=
match l with | [] => True | cons t r => le e (elem t) ∧ le_roots e r end.
Admit Obligations.
Program Fixpoint heaps (l : list tree) : Prop :=
match l with | [] => True | cons (tree'mk e c _) r => le_roots e c ∧ heaps c ∧ heaps r end.
Admit Obligations.
Program Fixpoint occ (x : elt) (l : list tree) : Z :=
match l with | [] => 0%Z | cons (tree'mk y c _) r => (if decide (x = y) then 1%Z else 0%Z) + occ x c + occ x r end.
Admit Obligations.
Theorem occ_append'vc (x : elt) (l1 : list tree) (l2 : list tree) : occ x (l1 ++ l2) = occ x l1 + occ x l2.
Proof.
Admitted.
