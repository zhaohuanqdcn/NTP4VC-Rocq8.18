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
Definition xeh (c : ascii) : Z := if decide (48%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 58%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 48%Z else if decide (65%Z ≤ Z.of_nat (Ascii.nat_of_ascii c) ∧ Z.of_nat (Ascii.nat_of_ascii c) < 71%Z) then Z.of_nat (Ascii.nat_of_ascii c) - 55%Z else - 1%Z.
Definition valid_hex (s : string) := Z.quot (Z.of_nat (String.length s)) 2%Z = 0%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (String.length s) -> valid_hex_char (get_str_i s i)).
Definition encoding (s1 : string) (s2 : string) := Z.of_nat (String.length s2) = 2%Z * Z.of_nat (String.length s1) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (String.length s1) -> get_str_i s1 i = Ascii.ascii_of_nat (Z.to_nat (xeh (get_str_i s2 (2%Z * i)) * 16%Z + xeh (get_str_i s2 (2%Z * i + 1%Z))))) ∧ valid_hex s2.
Theorem decode_unique'vc (s1 : string) (s2 : string) (s3 : string) (fact0 : encoding s1 s2) (fact1 : encoding s3 s2) : s1 = s3.
Proof.
Admitted.
