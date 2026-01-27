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
Require Import pairing_heap_vcg.pairing_heap.HeapType.
Open Scope Z_scope.
Axiom occ_heap : elt -> raw_heap -> Z.
Axiom occ_tree : elt -> tree -> Z.
Axiom occ_list : elt -> list tree -> Z.
Axiom occ_heap_def : forall (x : elt) (h : raw_heap), occ_heap x h = (match h with | E => 0%Z | H t => occ_tree x t end).
Axiom occ_tree_def : forall (x : elt) (t : tree), occ_tree x t = (match t with | T e l => (if decide (x = e) then 1%Z else 0%Z) + occ_list x l end).
Axiom occ_list_def : forall (x : elt) (l : list tree), occ_list x l = (match l with | [] => 0%Z | cons t r => occ_tree x t + occ_list x r end).
Theorem occ_list_nonneg'vc (x : elt) (l : list tree) : 0%Z ≤ occ_list x l.
Admitted.
