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
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (i_5 : Z) (t_1 : addr -> Z) (i_1 : Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (a : addr) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_5 in let x : Z := t_1 a_2 in let a_3 : addr := shift a_1 0%Z in let x_1 : Z := 1%Z + i_1 + i_2 in let x_2 : Z := 1%Z + i_3 + i_4 in let a_4 : addr := shift a 0%Z in let a_5 : addr := shift a_1 (l_length t_1 a_1) in ¬ x = 0%Z -> 0%Z < i -> i_5 ≤ i -> i_5 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_uint32 i_5 -> p_length_of_str_is t t_1 a i_2 -> p_length_of_str_is t t_1 a i_4 -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_3 -> addr_le a_1 a_2 -> is_sint8 x -> valid_rw t a_3 x_1 -> valid_rw t a_3 x_2 -> separated a_4 (1%Z + i_2) a_3 x_1 -> separated a_4 (1%Z + i_4) a_3 x_2 -> addr_le a_2 a_5 -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 < i_5 -> ¬ t_1 (shift a_1 i_6) = 0%Z) -> addr_le (shift a_1 (1%Z + i_5)) a_5.
Admitted.
