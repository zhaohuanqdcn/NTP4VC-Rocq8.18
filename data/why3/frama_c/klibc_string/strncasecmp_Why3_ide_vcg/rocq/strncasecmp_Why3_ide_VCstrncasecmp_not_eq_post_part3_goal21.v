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
Theorem goal21 (a : addr) (i : Z) (a_1 : addr) (a_6 : addr) (a_7 : addr) (t_1 : addr -> Z) (i_5 : Z) (t : Z -> Z) (i_1 : Z) (i_4 : Z) (i_2 : Z) (i_3 : Z) (a_2 : addr) (a_4 : addr) (a_3 : addr) (a_5 : addr) : let a_8 : addr := shift a i in let a_9 : addr := shift a_1 i in let a_10 : addr := shift a_6 0%Z in let a_11 : addr := shift a_7 0%Z in ¬ l_toupper (to_uint8 (t_1 (shift a_7 i_5))) = l_toupper (to_uint8 (t_1 (shift a_6 i_5))) -> 0%Z < i -> 0%Z ≤ i_5 -> i_5 < i -> region (base a_6) ≤ 0%Z -> region (base a_7) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> p_length_of_str_is t t_1 a_6 i_1 -> p_length_of_str_is t t_1 a_6 i_4 -> p_length_of_str_is t t_1 a_7 i_2 -> p_length_of_str_is t t_1 a_7 i_3 -> addr_le a_2 a_8 -> addr_le a_4 a_9 -> addr_le a_8 (shift a_3 i) -> addr_le a_9 (shift a_5 i) -> valid_rw t a_10 i -> valid_rw t a_11 i -> separated a_11 i a_10 i -> ¬ (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 < i -> l_toupper (to_uint8 (t_1 (shift a_7 i_6))) = l_toupper (to_uint8 (t_1 (shift a_6 i_6)))).
Admitted.
