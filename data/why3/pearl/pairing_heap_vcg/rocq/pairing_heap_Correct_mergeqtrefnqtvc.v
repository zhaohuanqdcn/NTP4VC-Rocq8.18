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
Require Import pairing_heap_vcg.pairing_heap.PairingHeap.
Open Scope Z_scope.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Definition mem (x : elt) (h : heap1) := 0%Z < occ x h.
Definition is_minimum (x : elt) (h : heap1) := mem x h ∧ (∀(e : elt), mem e h -> le x e).
Axiom min_def : forall  (h : heap1) (fact0 : 0%Z < PairingHeap.size h), is_minimum (minimum_heap h) h.
Theorem merge'refn'vc (result : heap1) (h1 : heap1) (h2 : heap1) (fact0 : size_heap (h result) = size_heap (h h1) + size_heap (h h2)) (fact1 : ∀(x : elt), occ_heap x (h result) = occ_heap x (h h1) + occ_heap x (h h2)) : (∀(x : elt), occ x result = occ x h1 + occ x h2) ∧ PairingHeap.size result = PairingHeap.size h1 + PairingHeap.size h2.
Proof.
Admitted.
