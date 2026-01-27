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
Axiom size_heap : raw_heap -> Z.
Axiom size_tree : tree -> Z.
Axiom size_list : list tree -> Z.
Axiom size_heap_def : forall (h : raw_heap), size_heap h = (match h with | E => 0%Z | H t => size_tree t end).
Axiom size_tree_def : forall (t : tree), size_tree t = (match t with | T _ l => 1%Z + size_list l end).
Axiom size_list_def : forall (l : list tree), size_list l = (match l with | [] => 0%Z | cons t l1 => size_tree t + size_list l1 end).
Theorem size_list_nonneg'vc (l : list tree) : 0%Z ≤ size_list l.
Admitted.
