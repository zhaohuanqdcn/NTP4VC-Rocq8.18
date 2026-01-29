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
Require Import pairing_heap_vcg.pairing_heap.HeapType.
Require Import pairing_heap_vcg.pairing_heap.Size.
Require Import pairing_heap_vcg.pairing_heap.Occ.
Open Scope Z_scope.
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Definition le_tree (e : elt) (t : tree) := match t with | T x _ => le e x end.
Definition le_root (e : elt) (h : raw_heap) := match h with | E => True | H t => le_tree e t end.
Program Fixpoint le_roots (e : elt) (l : list tree) : Prop :=
match l with | [] => True | cons t r => le_tree e t ∧ le_roots e r end.
Admit Obligations.
Axiom heap : raw_heap -> Prop.
Axiom heap_tree : tree -> Prop.
Axiom heap_list : list tree -> Prop.
Axiom heap_def : forall (h : raw_heap), heap h = (match h with | E => True | H t => heap_tree t end).
Axiom heap_tree_def : forall (t : tree), heap_tree t = (match t with | T x l => le_roots x l ∧ heap_list l end).
Axiom heap_list_def : forall (l : list tree), heap_list l = (match l with | [] => True | cons t r => heap_tree t ∧ heap_list r end).
Theorem heap'vc : heap E.
Proof.
Admitted.
