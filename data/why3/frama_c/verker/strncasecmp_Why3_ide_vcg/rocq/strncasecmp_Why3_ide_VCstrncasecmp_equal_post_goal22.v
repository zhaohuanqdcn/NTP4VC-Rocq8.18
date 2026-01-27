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
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal22 (a_2 : addr) (a : addr) (i_3 : Z) (t_1 : addr -> Z) (a_3 : addr) (a_1 : addr) (i_2 : Z) (i_8 : Z) (i_5 : Z) (t : Z -> Z) (i_6 : Z) (i_7 : Z) (i_9 : Z) (i_10 : Z) (i_11 : Z) (i_12 : Z) (i_13 : Z) (i : Z) (i_1 : Z) (i_4 : Z) : let x : Z := offset a_2 in let x_1 : Z := offset a in let x_3 : Z := i_3 + x - x_1 in let x_4 : Z := l_strnlen t_1 a_2 i_3 in let x_5 : Z := l_strnlen t_1 a_3 i_3 in let x_6 : Z := i_3 + x in let x_7 : Z := t_1 a in let x_8 : Z := t_1 a_1 in let x_9 : Z := to_uint8 x_8 in let x_10 : Z := to_uint8 x_7 in let x_11 : Z := i_2 + i_8 in let x_12 : Z := i_5 + x_1 in let x_13 : Z := to_uint64 (i_3 + x - 1%Z - x_1) in ¬ i_3 = 0%Z -> offset a_1 + x = x_1 + offset a_3 -> x + l_strnlen t_1 a x_3 = x_1 + x_4 -> x + l_strnlen t_1 a_1 x_3 = x_1 + x_5 -> x ≤ x_1 -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> x_1 ≤ x_6 -> linked t -> sconst t_1 -> is_uint8 i_6 -> is_uint8 i_7 -> is_uint8 i_8 -> is_uint8 i_9 -> is_uint8 i_10 -> is_uint8 i_11 -> is_uint8 i_12 -> is_uint8 i_13 -> is_sint8 i -> is_sint8 i_1 -> is_sint32 i_2 -> is_uint64 i_3 -> is_uint64 i_4 -> is_uint64 i_5 -> addr_le a_2 a -> addr_le a_3 a_1 -> is_sint8 x_7 -> is_sint8 x_8 -> p_valid_strn t t_1 a_2 i_3 -> p_valid_strn t t_1 a_3 i_3 -> is_uint64 x_3 -> addr_le a (shift a_2 x_4) -> addr_le a_1 (shift a_3 x_5) -> p_valid_strn t t_1 a x_3 -> p_valid_strn t t_1 a_1 x_3 -> (if decide (x_9 = 0%Z) then i_13 = 0%Z ∧ x_10 = i_8 ∧ x_11 = 0%Z else x_10 = i_6 ∧ (if decide (i_6 = 0%Z) then i_8 = 0%Z ∧ i_12 = i_2 ∧ i_13 = i_2 ∧ i_13 = i_12 ∧ x_9 = i_2 else i_7 = i_6 ∧ x_9 = i_9 ∧ x_11 = i_13 ∧ (if decide (i_9 = i_6) then i_8 = i_6 ∧ i_13 = i_9 ∧ x_12 = x_6 ∧ x_13 = 0%Z else i_10 = i_9 ∧ i_13 = i_11 ∧ to_uint8 i = i_8 ∧ to_uint8 i_1 = i_13 ∧ l_tolower x_7 = i ∧ l_tolower x_8 = i_1 ∧ i_4 + x_1 = x_6 ∧ (¬ i_13 = i_8 ∨ x_12 = x_6 ∧ x_13 = 0%Z)))) -> (∀(i_14 : Z), 0%Z ≤ i_14 -> i_14 + x < x_1 -> l_tolower (t_1 (shift a_3 i_14)) = l_tolower (t_1 (shift a_2 i_14))) -> (∀(i_14 : Z), 0%Z ≤ i_14 -> i_14 ≤ x_5 -> l_tolower (t_1 (shift a_3 i_14)) = l_tolower (t_1 (shift a_2 i_14))) -> i_2 = 0%Z.
Admitted.
