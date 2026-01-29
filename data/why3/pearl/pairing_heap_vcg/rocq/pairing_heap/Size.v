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
Open Scope Z_scope.
Axiom size_heap : raw_heap -> Z.
Axiom size_tree : tree -> Z.
Axiom size_list : list tree -> Z.
Axiom size_heap_def : forall (h : raw_heap), size_heap h = (match h with | E => 0%Z | H t => size_tree t end).
Axiom size_tree_def : forall (t : tree), size_tree t = (match t with | T _ l => 1%Z + size_list l end).
Axiom size_list_def : forall (l : list tree), size_list l = (match l with | [] => 0%Z | cons t l1 => size_tree t + size_list l1 end).
