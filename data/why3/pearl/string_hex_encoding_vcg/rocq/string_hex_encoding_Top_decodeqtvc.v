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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.string.StringBuffer.
Open Scope Z_scope.
Definition valid_hex_char (c : ascii) := 48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 58%Z ∨ 65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 71%Z.
Definition hex (i : Z) : ascii := if decide (0%Z ≤ i ∧ i < 10%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 48%Z)) else if decide (10%Z ≤ i ∧ i < 16%Z) then Ascii.ascii_of_nat (Z.to_nat (i + 55%Z)) else get_str_i (String (Ascii.ascii_of_nat 0%nat) EmptyString) 0%Z.
Definition xeh (c : ascii) : Z := if decide (48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 58%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 48%Z else if decide (65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 71%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 55%Z else - 1%Z.
Definition valid_hex (s : string) := Z.quot (Z.of_nat (String.length s)) 2%Z = 0%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (String.length s) -> valid_hex_char (get_str_i s i)).
Definition encoding (s1 : string) (s2 : string) := Z.of_nat (String.length s2) = 2%Z * Z.of_nat (String.length s1) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (String.length s1) -> get_str_i s1 i = Ascii.ascii_of_nat (Z.to_nat (xeh (get_str_i s2 (2%Z * i)) * 16%Z + xeh (get_str_i s2 (2%Z * i + 1%Z))))) ∧ valid_hex s2.
Theorem decode'vc (s : string) (o1 : bv 63%N) (fact0 : valid_hex s) (fact1 : bv_signed o1 = Z.of_nat (String.length s)) (fact2 : 0%Z ≤ Z.of_nat (String.length s)) : ¬ 2%Z = 0%Z ∧ int'63_in_bounds (Z.rem (bv_signed o1) 2%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = Z.rem (bv_signed o1) 2%Z -> (∀(r : buffer), str r = ""%string -> (Z.quot 0%Z 2%Z = 0%Z ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (String.length s)) ∧ Z.of_nat (String.length (str r)) = Z.rem 0%Z 2%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.rem 0%Z 2%Z -> get_str_i (str r) j = Ascii.ascii_of_nat (Z.to_nat (xeh (get_str_i s (2%Z * j)) * 16%Z + xeh (get_str_i s (2%Z * j + 1%Z)))))) ∧ (∀(r1 : buffer) (i : bv 63%N), Z.quot (bv_signed i) 2%Z = 0%Z ∧ (0%Z ≤ bv_signed i ∧ bv_signed i ≤ Z.of_nat (String.length s)) ∧ Z.of_nat (String.length (str r1)) = Z.rem (bv_signed i) 2%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.rem (bv_signed i) 2%Z -> get_str_i (str r1) j = Ascii.ascii_of_nat (Z.to_nat (xeh (get_str_i s (2%Z * j)) * 16%Z + xeh (get_str_i s (2%Z * j + 1%Z))))) -> (∀(o3 : bv 63%N), bv_signed o3 = Z.of_nat (String.length s) ∧ 0%Z ≤ Z.of_nat (String.length s) -> (if decide (bv_signed i < bv_signed o3) then (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (String.length s)) ∧ (let o4 : ascii := get_str_i s (bv_signed i) in valid_hex_char o4 ∧ (∀(v_i : bv 63%N), bv_signed v_i = xeh o4 -> int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o5 : bv 63%N), bv_signed o5 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed o5 ∧ bv_signed o5 < Z.of_nat (String.length s)) ∧ (let o6 : ascii := get_str_i s (bv_signed o5) in valid_hex_char o6 ∧ (∀(v_ii : bv 63%N), bv_signed v_ii = xeh o6 -> int'63_in_bounds (bv_signed v_i * 16%Z) ∧ (∀(o7 : bv 63%N), bv_signed o7 = bv_signed v_i * 16%Z -> int'63_in_bounds (bv_signed o7 + bv_signed v_ii) ∧ (∀(o8 : bv 63%N), bv_signed o8 = bv_signed o7 + bv_signed v_ii -> (0%Z ≤ bv_signed o8 ∧ bv_signed o8 < 256%Z) ∧ (∀(r2 : buffer), str r2 = append (str r1) (String (Ascii.ascii_of_nat (Z.to_nat (bv_signed o8))) EmptyString) -> int'63_in_bounds (bv_signed i + 2%Z) ∧ (∀(o9 : bv 63%N), bv_signed o9 = bv_signed i + 2%Z -> (0%Z ≤ Z.of_nat (String.length s) - bv_signed i ∧ Z.of_nat (String.length s) - bv_signed o9 < Z.of_nat (String.length s) - bv_signed i) ∧ Z.quot (bv_signed o9) 2%Z = 0%Z ∧ (0%Z ≤ bv_signed o9 ∧ bv_signed o9 ≤ Z.of_nat (String.length s)) ∧ Z.of_nat (String.length (str r2)) = Z.rem (bv_signed o9) 2%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.rem (bv_signed o9) 2%Z -> get_str_i (str r2) j = Ascii.ascii_of_nat (Z.to_nat (xeh (get_str_i s (2%Z * j)) * 16%Z + xeh (get_str_i s (2%Z * j + 1%Z)))))))))))))) else encoding (str r1) s))))).
Admitted.
