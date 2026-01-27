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
Require Import Why3.string.StringBuffer.
Open Scope Z_scope.
Definition int2b64 (i : Z) : ascii := if decide (0%Z ≤ i ∧ i ≤ 25%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 65%Z)) else if decide (26%Z ≤ i ∧ i ≤ 51%Z) then Ascii.ascii_of_nat (Z.to_nat (i - 26%Z + 97%Z)) else if decide (52%Z ≤ i ∧ i ≤ 61%Z) then Ascii.ascii_of_nat (Z.to_nat (i - 52%Z + 48%Z)) else if decide (i = 62%Z) then Ascii.ascii_of_nat 43%nat else if decide (i = 63%Z) then Ascii.ascii_of_nat 47%nat else Ascii.ascii_of_nat 0%nat.
Definition valid_b64_char (c : ascii) := 65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 90%Z ∨ 97%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 122%Z ∨ 48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 57%Z ∨ Z.of_nat (Ascii.nat_of_ascii c) = 43%Z ∨ Z.of_nat (Ascii.nat_of_ascii c) = 47%Z.
Definition b642int (c : ascii) : Z := if decide (65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 90%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 65%Z else if decide (97%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 122%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 97%Z + 26%Z else if decide (48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 57%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 48%Z + 52%Z else if decide (Z.of_nat (Ascii.nat_of_ascii c) = 43%Z) then 62%Z else if decide (Z.of_nat (Ascii.nat_of_ascii c) = 47%Z) then 63%Z else if decide (c = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then 0%Z else 64%Z.
Definition get_pad (s : string) : Z := if decide (1%Z ≤ Z.of_nat (String.length s) ∧ get_str_i s (Z.of_nat (String.length s) - 1%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then if decide (2%Z ≤ Z.of_nat (String.length s) ∧ get_str_i s (Z.of_nat (String.length s) - 2%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then 2%Z else 1%Z else 0%Z.
Definition calc_pad (s : string) : Z := if decide (Z.quot (Z.of_nat (String.length s)) 3%Z = 1%Z) then 2%Z else if decide (Z.quot (Z.of_nat (String.length s)) 3%Z = 2%Z) then 1%Z else 0%Z.
Theorem calc_pad_mod3'vc (s : string) : Z.quot (Z.of_nat (String.length s) + calc_pad s) 3%Z = 0%Z.
Admitted.
