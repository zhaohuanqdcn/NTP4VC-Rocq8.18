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
Theorem delete_min'refn'vc (h : heap1) (fact0 : 0%Z < PairingHeap.size h) : 0%Z < size_heap (PairingHeap.h h) ∧ (∀(result : heap1), occ_heap (minimum (PairingHeap.h h)) (PairingHeap.h result) = occ_heap (minimum (PairingHeap.h h)) (PairingHeap.h h) - 1%Z ∧ (∀(y : elt), ¬ y = minimum (PairingHeap.h h) -> occ_heap y (PairingHeap.h result) = occ_heap y (PairingHeap.h h)) ∧ size_heap (PairingHeap.h result) = size_heap (PairingHeap.h h) - 1%Z -> (let x : elt := minimum_heap h in occ x result = occ x h - 1%Z) ∧ (∀(y : elt), ¬ y = minimum_heap h -> occ y result = occ y h) ∧ PairingHeap.size result = PairingHeap.size h - 1%Z).
Admitted.
