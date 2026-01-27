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
Theorem goal20 (i_1 : Z) (i_2 : Z) (a_1 : addr) (a : addr) (t_1 : addr -> Z) (a_6 : addr) (a_7 : addr) (t_2 : addr -> Z) (i_7 : Z) (t : Z -> Z) (i : Z) (i_3 : Z) (i_6 : Z) (i_4 : Z) (i_5 : Z) (a_2 : addr) (a_4 : addr) (a_3 : addr) (a_5 : addr) : let x : Z := i_1 - i_2 in let a_8 : addr := shift a_1 x in let a_9 : addr := shift a x in let x_1 : Z := t_1 a_9 in let a_10 : addr := shift a_6 0%Z in let a_11 : addr := shift a_7 0%Z in ¬ i_2 = 0%Z -> ¬ l_toupper (to_uint8 (t_2 (shift a_7 i_7))) = l_toupper (to_uint8 (t_2 (shift a_6 i_7))) -> t_1 a_8 = 0%Z -> 0%Z < i_1 -> i_2 ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_7 -> i_7 < i_1 -> region (base a_6) ≤ 0%Z -> region (base a_7) ≤ 0%Z -> 0%Z ≤ x_1 -> x_1 ≤ 255%Z -> linked t -> sconst t_2 -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> p_length_of_str_is t t_2 a_6 i_3 -> p_length_of_str_is t t_2 a_6 i_6 -> p_length_of_str_is t t_2 a_7 i_4 -> p_length_of_str_is t t_2 a_7 i_5 -> valid_rw t a_10 i_1 -> valid_rw t a_11 i_1 -> separated a_11 i_1 a_10 i_1 -> addr_le a_2 a_9 -> addr_le a_4 a_8 -> addr_le a_9 (shift a_3 i_1) -> addr_le a_8 (shift a_5 i_1) -> is_uint8 x_1 -> (p_is_lower 0%Z -> i = - 32%Z) -> (p_is_upper 0%Z -> i = 0%Z) -> (¬ p_is_lower 0%Z -> ¬ p_is_upper 0%Z -> i = 0%Z) -> (p_is_upper x_1 -> x_1 = i) -> (p_is_lower x_1 -> x_1 = 32%Z + i) -> (¬ p_is_lower x_1 -> ¬ p_is_upper x_1 -> x_1 = i) -> ¬ (∀(i_8 : Z), 0%Z ≤ i_8 -> i_8 + i_2 < i_1 -> l_toupper (to_uint8 (t_2 (shift a_7 i_8))) = l_toupper (to_uint8 (t_2 (shift a_6 i_8)))).
Admitted.
