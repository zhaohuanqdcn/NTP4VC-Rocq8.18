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
Require Import vstte12_ring_buffer_vcg.vstte12_ring_buffer.RingBuffer.
Open Scope Z_scope.
Theorem harness2'vc : 0%Z < 3%Z ∧ (∀(b : buffer Z), RingBuffer.size b = 3%Z ∧ sequence b = ([] : list Z) -> len b < RingBuffer.size b ∧ (∀(b1 : buffer Z), length (data b1) = length (data b) -> first b = first b1 -> len b1 = len b + 1%Z ∧ sequence b1 = sequence b ++ cons 1%Z ([] : list Z) -> len b1 < RingBuffer.size b1 ∧ (∀(b2 : buffer Z), length (data b2) = length (data b1) -> first b1 = first b2 -> len b2 = len b1 + 1%Z ∧ sequence b2 = sequence b1 ++ cons 2%Z ([] : list Z) -> len b2 < RingBuffer.size b2 ∧ (∀(b3 : buffer Z), length (data b3) = length (data b2) -> first b2 = first b3 -> len b3 = len b2 + 1%Z ∧ sequence b3 = sequence b2 ++ cons 3%Z ([] : list Z) -> 0%Z < len b3 ∧ (∀(b4 : buffer Z), data b3 = data b4 -> (∀(x : Z), len b4 = len b3 - 1%Z ∧ (match sequence b3 with | [] => False | cons x1 l => x = x1 ∧ sequence b4 = l end) -> len b4 < RingBuffer.size b4 ∧ (∀(b5 : buffer Z), length (data b5) = length (data b4) -> first b4 = first b5 -> len b5 = len b4 + 1%Z ∧ sequence b5 = sequence b4 ++ cons 4%Z ([] : list Z) -> 0%Z < len b5 ∧ (∀(b6 : buffer Z), data b5 = data b6 -> (∀(x1 : Z), len b6 = len b5 - 1%Z ∧ (match sequence b5 with | [] => False | cons x2 l => x1 = x2 ∧ sequence b6 = l end) -> 0%Z < len b6 ∧ (∀(b7 : buffer Z), data b6 = data b7 -> (∀(x2 : Z), len b7 = len b6 - 1%Z ∧ (match sequence b6 with | [] => False | cons x3 l => x2 = x3 ∧ sequence b7 = l end) -> 0%Z < len b7))))))))))).
Admitted.
