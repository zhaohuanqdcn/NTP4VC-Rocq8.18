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
Require Import vstte12_ring_buffer_vcg.vstte12_ring_buffer.RingBuffer.
Open Scope Z_scope.
Theorem test'vc (x : Z) (y : Z) (z : Z) : 0%Z < 2%Z ∧ (∀(b : buffer Z), RingBuffer.size b = 2%Z ∧ sequence b = ([] : list Z) -> len b < RingBuffer.size b ∧ (∀(b1 : buffer Z), length (data b1) = length (data b) -> first b = first b1 -> len b1 = len b + 1%Z ∧ sequence b1 = sequence b ++ cons x ([] : list Z) -> len b1 < RingBuffer.size b1 ∧ (∀(b2 : buffer Z), length (data b2) = length (data b1) -> first b1 = first b2 -> len b2 = len b1 + 1%Z ∧ sequence b2 = sequence b1 ++ cons y ([] : list Z) -> 0%Z < len b2 ∧ (∀(b3 : buffer Z), data b2 = data b3 -> (∀(h : Z), len b3 = len b2 - 1%Z ∧ (match sequence b2 with | [] => False | cons x1 l => h = x1 ∧ sequence b3 = l end) -> len b3 < RingBuffer.size b3 ∧ (∀(b4 : buffer Z), length (data b4) = length (data b3) -> first b3 = first b4 -> len b4 = len b3 + 1%Z ∧ sequence b4 = sequence b3 ++ cons z ([] : list Z) -> 0%Z < len b4 ∧ (∀(b5 : buffer Z), data b4 = data b5 -> (∀(h1 : Z), len b5 = len b4 - 1%Z ∧ (match sequence b4 with | [] => False | cons x1 l => h1 = x1 ∧ sequence b5 = l end) -> 0%Z < len b5)))))))).
Proof.
Admitted.
