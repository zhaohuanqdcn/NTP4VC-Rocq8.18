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
Definition b642int (c : ascii) : Z := if decide (65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 90%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 65%Z else if decide (97%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 122%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 97%Z + 26%Z else if decide (48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) ≤ 57%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 48%Z + 52%Z else if decide (Z.of_nat (Ascii.nat_of_ascii c) = 43%Z) then 62%Z else if decide (Z.of_nat (Ascii.nat_of_ascii c) = 47%Z) then 63%Z else if decide (c = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then 0%Z else 64%Z.
Definition get_pad (s : string) : Z := if decide (1%Z ≤ Z.of_nat (String.length s) ∧ get_str_i s (Z.of_nat (String.length s) - 1%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then if decide (2%Z ≤ Z.of_nat (String.length s) ∧ get_str_i s (Z.of_nat (String.length s) - 2%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) then 2%Z else 1%Z else 0%Z.
Definition calc_pad (s : string) : Z := if decide (Z.quot (Z.of_nat (String.length s)) 3%Z = 1%Z) then 2%Z else if decide (Z.quot (Z.of_nat (String.length s)) 3%Z = 2%Z) then 1%Z else 0%Z.
Definition encoding (s1 : string) (s2 : string) := Z.of_nat (String.length s2) = Z.rem (Z.of_nat (String.length s1) + calc_pad s1) 3%Z * 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.rem (Z.of_nat (String.length s2)) 4%Z -> (match (get_str_i s2 (4%Z * i), (get_str_i s2 (4%Z * i + 1%Z), (get_str_i s2 (4%Z * i + 2%Z), get_str_i s2 (4%Z * i + 3%Z)))) with | (b1, (b2, (b3, b4))) => get_str_i s1 (i * 3%Z) = Ascii.ascii_of_nat (Z.to_nat (b642int b1 * 4%Z + Z.rem (b642int b2) 16%Z)) ∧ (i * 3%Z + 1%Z < Z.of_nat (String.length s1) -> get_str_i s1 (i * 3%Z + 1%Z) = Ascii.ascii_of_nat (Z.to_nat (Z.quot (b642int b2) 16%Z * 16%Z + Z.rem (b642int b3) 4%Z))) ∧ (i * 3%Z + 2%Z < Z.of_nat (String.length s1) -> get_str_i s1 (i * 3%Z + 2%Z) = Ascii.ascii_of_nat (Z.to_nat (Z.quot (b642int b3) 4%Z * 64%Z + b642int b4))) end)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (String.length s2) - get_pad s2 -> valid_b64_char (get_str_i s2 i)) ∧ (get_pad s2 = 1%Z -> Z.quot (b642int (get_str_i s2 (Z.of_nat (String.length s2) - 2%Z))) 4%Z = 0%Z ∧ get_str_i s2 (Z.of_nat (String.length s2) - 1%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) ∧ (get_pad s2 = 2%Z -> Z.quot (b642int (get_str_i s2 (Z.of_nat (String.length s2) - 3%Z))) 16%Z = 0%Z ∧ get_str_i s2 (Z.of_nat (String.length s2) - 2%Z) = get_str_i s2 (Z.of_nat (String.length s2) - 1%Z) ∧ get_str_i s2 (Z.of_nat (String.length s2) - 1%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) ∧ calc_pad s1 = get_pad s2.
Definition valid_b64 (s : string) := Z.quot (Z.of_nat (String.length s)) 4%Z = 0%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (String.length s) - get_pad s -> valid_b64_char (get_str_i s i)) ∧ (get_pad s = 1%Z -> Z.quot (b642int (get_str_i s (Z.of_nat (String.length s) - 2%Z))) 4%Z = 0%Z ∧ get_str_i s (Z.of_nat (String.length s) - 1%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))) ∧ (get_pad s = 2%Z -> Z.quot (b642int (get_str_i s (Z.of_nat (String.length s) - 3%Z))) 16%Z = 0%Z ∧ get_str_i s (Z.of_nat (String.length s) - 2%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N))) ∧ get_str_i s (Z.of_nat (String.length s) - 1%Z) = Ascii.ascii_of_nat (Z.to_nat (bv_signed (61%bv : bv 63%N)))).
Theorem decode_unique'vc (s1 : string) (s2 : string) (s3 : string) (fact0 : encoding s1 s2) (fact1 : encoding s3 s2) : s1 = s3.
Proof.
Admitted.
