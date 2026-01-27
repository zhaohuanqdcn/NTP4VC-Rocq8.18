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
Require Import vstte12_ring_buffer_vcg.vstte12_ring_buffer.RingBufferSeq.
Open Scope Z_scope.
Theorem harness2'vc : 0%Z < 3%Z ∧ (∀(b : buffer Z), RingBufferSeq.size b = 3%Z ∧ sequence b = ([] : list Z) -> len b < RingBufferSeq.size b ∧ (∀(b1 : buffer Z), length (data b1) = length (data b) -> first b = first b1 -> len b1 = len b + 1%Z ∧ sequence b1 = sequence b ++ [1%Z] -> len b1 < RingBufferSeq.size b1 ∧ (∀(b2 : buffer Z), length (data b2) = length (data b1) -> first b1 = first b2 -> len b2 = len b1 + 1%Z ∧ sequence b2 = sequence b1 ++ [2%Z] -> len b2 < RingBufferSeq.size b2 ∧ (∀(b3 : buffer Z), length (data b3) = length (data b2) -> first b2 = first b3 -> len b3 = len b2 + 1%Z ∧ sequence b3 = sequence b2 ++ [3%Z] -> 0%Z < len b3 ∧ (∀(b4 : buffer Z), data b3 = data b4 -> len b4 = len b3 - 1%Z ∧ sequence b4 = drop 1%nat (sequence b3) -> len b4 < RingBufferSeq.size b4 ∧ (∀(b5 : buffer Z), length (data b5) = length (data b4) -> first b4 = first b5 -> len b5 = len b4 + 1%Z ∧ sequence b5 = sequence b4 ++ [4%Z] -> 0%Z < len b5 ∧ (∀(b6 : buffer Z), data b5 = data b6 -> len b6 = len b5 - 1%Z ∧ sequence b6 = drop 1%nat (sequence b5) -> 0%Z < len b6 ∧ (∀(b7 : buffer Z), data b6 = data b7 -> len b7 = len b6 - 1%Z ∧ sequence b7 = drop 1%nat (sequence b6) -> 0%Z < len b7)))))))).
Admitted.
