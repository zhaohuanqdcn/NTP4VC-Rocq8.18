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
Require Import vstte12_ring_buffer_vcg.vstte12_ring_buffer.RingBufferSeq.
Open Scope Z_scope.
Theorem test'vc (x : Z) (y : Z) (z : Z) : 0%Z < 2%Z ∧ (∀(b : buffer Z), RingBufferSeq.size b = 2%Z ∧ sequence b = ([] : list Z) -> len b < RingBufferSeq.size b ∧ (∀(b1 : buffer Z), length (data b1) = length (data b) -> first b = first b1 -> len b1 = len b + 1%Z ∧ sequence b1 = sequence b ++ [x] -> len b1 < RingBufferSeq.size b1 ∧ (∀(b2 : buffer Z), length (data b2) = length (data b1) -> first b1 = first b2 -> len b2 = len b1 + 1%Z ∧ sequence b2 = sequence b1 ++ [y] -> 0%Z < len b2 ∧ (∀(b3 : buffer Z), data b2 = data b3 -> len b3 = len b2 - 1%Z ∧ sequence b3 = drop 1%nat (sequence b2) -> len b3 < RingBufferSeq.size b3 ∧ (∀(b4 : buffer Z), length (data b4) = length (data b3) -> first b3 = first b4 -> len b4 = len b3 + 1%Z ∧ sequence b4 = sequence b3 ++ [z] -> 0%Z < len b4 ∧ (∀(b5 : buffer Z), data b4 = data b5 -> len b5 = len b4 - 1%Z ∧ sequence b5 = drop 1%nat (sequence b4) -> 0%Z < len b5)))))).
Proof.
Admitted.
