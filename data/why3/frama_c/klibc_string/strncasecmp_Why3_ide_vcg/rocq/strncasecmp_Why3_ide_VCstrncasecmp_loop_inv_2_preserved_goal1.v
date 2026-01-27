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
Require Import Why3.Memory.Memory.
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Axiomatic2.Axiomatic2.
Require Import klibc_string.A_ToUpper.A_ToUpper.
Open Scope Z_scope.
Theorem goal1 (i_2 : Z) (i_1 : Z) (a_1 : addr) (t_1 : addr -> Z) (a : addr) (a_6 : addr) (a_7 : addr) (i : Z) (i_7 : Z) (t : Z -> Z) (t_2 : addr -> Z) (i_3 : Z) (i_6 : Z) (i_4 : Z) (i_5 : Z) (a_2 : addr) (a_4 : addr) (a_3 : addr) (a_5 : addr) : let x : Z := i_2 - i_1 in let a_8 : addr := shift a_1 x in let x_1 : Z := t_1 a_8 in let a_9 : addr := shift a x in let x_2 : Z := t_1 a_9 in let a_10 : addr := shift a_6 0%Z in let a_11 : addr := shift a_7 0%Z in let x_3 : Z := 32%Z + i in ¬ i_1 = 0%Z -> ¬ x_1 = 0%Z -> 0%Z < i_2 -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> 0%Z ≤ i_7 -> region (base a_6) ≤ 0%Z -> region (base a_7) ≤ 0%Z -> i_7 + to_uint32 (i_1 - 1%Z) < i_2 -> 0%Z ≤ x_2 -> 0%Z ≤ x_1 -> x_2 ≤ 255%Z -> x_1 ≤ 255%Z -> linked t -> sconst t_2 -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> p_length_of_str_is t t_2 a_6 i_3 -> p_length_of_str_is t t_2 a_6 i_6 -> p_length_of_str_is t t_2 a_7 i_4 -> p_length_of_str_is t t_2 a_7 i_5 -> valid_rw t a_10 i_2 -> valid_rw t a_11 i_2 -> separated a_11 i_2 a_10 i_2 -> addr_le a_2 a_9 -> addr_le a_4 a_8 -> addr_le a_9 (shift a_3 i_2) -> addr_le a_8 (shift a_5 i_2) -> is_uint8 x_2 -> is_uint8 x_1 -> (p_is_upper x_2 -> x_2 = i) -> (p_is_lower x_2 -> x_2 = x_3) -> (p_is_upper x_1 -> x_1 = i) -> (p_is_lower x_1 -> x_1 = x_3) -> (¬ p_is_lower x_2 -> ¬ p_is_upper x_2 -> x_2 = i) -> (¬ p_is_lower x_1 -> ¬ p_is_upper x_1 -> x_1 = i) -> (∀(i_8 : Z), 0%Z ≤ i_8 -> i_8 + i_1 < i_2 -> l_toupper (to_uint8 (t_2 (shift a_7 i_8))) = l_toupper (to_uint8 (t_2 (shift a_6 i_8)))) -> l_toupper (to_uint8 (t_2 (shift a_7 i_7))) = l_toupper (to_uint8 (t_2 (shift a_6 i_7))).
Admitted.
