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
Definition valid_hex_char (c : ascii) := 48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 58%Z ∨ 65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 71%Z.
Definition hex (i : Z) : ascii := if decide (0%Z ≤ i ∧ i < 10%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 48%Z)) else if decide (10%Z ≤ i ∧ i < 16%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 55%Z)) else get_str_i (String (Ascii.ascii_of_nat 0%nat) EmptyString) 0%Z.
Theorem hex'vc (i : bv 63%N) (fact0 : 0%Z ≤ bv_signed i) (fact1 : bv_signed i < 16%Z) : (if decide (bv_signed i < 10%Z) then int'63_in_bounds (bv_signed i + 48%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed i + 48%Z -> 0%Z ≤ bv_signed o1 ∧ bv_signed o1 < 256%Z) else int'63_in_bounds (bv_signed i + 55%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed i + 55%Z -> 0%Z ≤ bv_signed o1 ∧ bv_signed o1 < 256%Z)) ∧ (∀(result : ascii), (if decide (bv_signed i < 10%Z) then ∃(o1 : bv 63%N), bv_signed o1 = bv_signed i + 48%Z ∧ result = Ascii.ascii_of_nat (Z.to_nat (bv_signed o1)) else ∃(o1 : bv 63%N), bv_signed o1 = bv_signed i + 55%Z ∧ result = Ascii.ascii_of_nat (Z.to_nat (bv_signed o1))) -> result = hex (bv_signed i)).
Proof.
Admitted.
