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
Theorem goal24 (a_1 : addr) (i_6 : Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_5 : Z) (a : addr) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_6 in let a_3 : addr := shift a_1 0%Z in let x : Z := 1%Z + i_2 + i_3 in let x_1 : Z := 1%Z + i_4 + i_5 in let a_4 : addr := shift a 0%Z in let x_2 : Z := l_length t_1 a_1 in t_1 a_2 = 0%Z -> 0%Z < i -> 0%Z < i_1 -> i_6 ≤ i -> i_6 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_uint32 i_6 -> is_sint32 i_1 -> p_length_of_str_is t t_1 a i_3 -> p_length_of_str_is t t_1 a i_5 -> p_length_of_str_is t t_1 a_1 i_2 -> p_length_of_str_is t t_1 a_1 i_4 -> addr_le a_1 a_2 -> ¬ invalid t a_3 i_1 -> valid_rw t a_3 x -> valid_rw t a_3 x_1 -> separated a_4 (1%Z + i_3) a_3 x -> separated a_4 (1%Z + i_5) a_3 x_1 -> addr_le a_2 (shift a_1 x_2) -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 < i_6 -> ¬ t_1 (shift a_1 i_7) = 0%Z) -> i_1 ≤ 1%Z + l_length t_1 a + x_2.
Admitted.
