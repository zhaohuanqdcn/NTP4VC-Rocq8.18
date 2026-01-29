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
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal24 (a_1 : addr) (a_2 : addr) (a : addr) (a_3 : addr) (i_5 : Z) (t_1 : addr -> Z) (i_3 : Z) (t : Z -> Z) (i_6 : Z) (i_7 : Z) (i_1 : Z) (i_2 : Z) (i : Z) (i_4 : Z) : let x : Z := offset a_1 in let x_1 : Z := offset a_2 in let x_2 : Z := offset a in let x_3 : Z := offset a_3 in let x_4 : Z := i_5 + x - x_2 in let x_5 : Z := l_strnlen t_1 a_1 i_5 in let x_6 : Z := x + x_5 in let x_7 : Z := l_strnlen t_1 a_3 i_5 in let x_8 : Z := i_5 + x in let x_10 : Z := x_2 - x in let x_11 : Z := t_1 (shift a_3 x_10) in let x_12 : Z := t_1 (shift a_1 x_10) in ¬ t_1 (shift a_3 i_3) = t_1 (shift a_1 i_3) -> x + x_1 = x_2 + x_3 -> x_2 + l_strnlen t_1 a x_4 = x_6 -> x_1 + l_strnlen t_1 a_2 x_4 = x_3 + x_7 -> 0%Z < i_5 -> 0%Z ≤ i_3 -> x ≤ x_2 -> region (base a_1) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> i_3 < x_7 -> x_2 ≤ x_8 -> linked t -> sconst t_1 -> is_uint8 i_6 -> is_uint8 i_7 -> is_uint64 i_5 -> addr_le a_1 a -> addr_le a_3 a_2 -> p_valid_strn t t_1 a_1 i_5 -> p_valid_strn t t_1 a_3 i_5 -> is_uint64 x_4 -> addr_le a (shift a_1 x_5) -> addr_le a_2 (shift a_3 x_7) -> p_valid_strn t t_1 a x_4 -> p_valid_strn t t_1 a_2 x_4 -> (if decide (x_8 = x_2) then i_1 = 0%Z else to_uint8 (t_1 a) = i_6 ∧ to_uint8 (t_1 a_2) = i_7 ∧ (if decide (i_7 = i_6) then i_1 = 0%Z ∧ i_7 = 0%Z else i_2 = i ∧ x_8 = i_4 + x_2 ∧ ¬ x_11 = x_12 ∧ x + to_uint64 x_10 = x_2 ∧ x_2 < x + l_strnlen t_1 a_3 (i_4 + x_2 - x) ∧ (if decide (i_7 < i_6) then i_1 = - 1%Z else i_1 = 1%Z) ∧ (if decide (i_7 < i_6) then i_2 = - 1%Z else i_2 = 1%Z) ∧ (if decide (to_uint8 x_11 < to_uint8 x_12) then i_2 = - 1%Z else i_2 = 1%Z)) ∧ (i_6 = 0%Z -> x_5 = l_strlen t_1 a_1 ∧ x_6 = x_2 ∧ p_valid_str t t_1 a_1) ∧ (i_7 = 0%Z -> x_7 = l_strlen t_1 a_3 ∧ x + x_7 = x_2 ∧ p_valid_str t t_1 a_3)) -> (∀(i_8 : Z), 0%Z ≤ i_8 -> i_8 + x < x_2 -> t_1 (shift a_3 i_8) = t_1 (shift a_1 i_8)) -> (∀(i_8 : Z), let x_13 : Z := t_1 (shift a_3 i_8) in let x_14 : Z := t_1 (shift a_1 i_8) in 0%Z ≤ i_8 -> i_8 < x_7 -> (to_uint8 x_13 = to_uint8 x_14) = (x_13 = x_14)) -> (∃(i_8 : Z), let x_13 : Z := t_1 (shift a_3 i_8) in let x_14 : Z := t_1 (shift a_1 i_8) in ¬ x_13 = x_14 ∧ 0%Z ≤ i_8 ∧ i_8 < x_7 ∧ (if decide (to_uint8 x_13 < to_uint8 x_14) then i_1 = - 1%Z else i_1 = 1%Z) ∧ (∀(i_9 : Z), 0%Z ≤ i_9 -> i_9 < i_8 -> t_1 (shift a_3 i_9) = t_1 (shift a_1 i_9))).
Proof.
Admitted.
