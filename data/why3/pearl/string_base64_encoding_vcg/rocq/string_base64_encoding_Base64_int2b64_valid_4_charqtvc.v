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
Require Import Why3.string.StringBuffer.
Open Scope Z_scope.
Definition int2b64 (i : Z) : ascii := if decide (0%Z ≤ i ∧ i ≤ 25%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 65%Z)) else if decide (26%Z ≤ i ∧ i ≤ 51%Z) then Ascii.ascii_of_nat (Z.to_nat (i - 26%Z + 97%Z)) else if decide (52%Z ≤ i ∧ i ≤ 61%Z) then Ascii.ascii_of_nat (Z.to_nat (i - 52%Z + 48%Z)) else if decide (i = 62%Z) then Ascii.ascii_of_nat 43%nat else if decide (i = 63%Z) then Ascii.ascii_of_nat 47%nat else Ascii.ascii_of_nat 0%nat.
Definition valid_b64_char (c : ascii) := 65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 90%Z ∨ 97%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 122%Z ∨ 48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 57%Z ∨ Z.of_nat (Ascii.nat_of_ascii c) = 43%Z ∨ Z.of_nat (Ascii.nat_of_ascii c) = 47%Z.
Theorem int2b64_valid_4_char'vc (i : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 64%Z) : valid_b64_char (int2b64 i).
Proof.
Admitted.
