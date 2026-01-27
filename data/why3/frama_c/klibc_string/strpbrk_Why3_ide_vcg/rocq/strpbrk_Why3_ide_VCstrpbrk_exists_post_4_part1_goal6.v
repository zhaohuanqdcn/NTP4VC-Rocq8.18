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
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal6 (a : addr) (i_7 : Z) (t_1 : addr -> Z) (i_4 : Z) (a_1 : addr) (t : Z -> Z) (i : Z) (i_2 : Z) (i_5 : Z) (i_1 : Z) (i_3 : Z) (i_6 : Z) : let a_2 : addr := shift a i_7 in let x : Z := t_1 a_2 in let x_1 : Z := l_length t_1 a in ¬ x = 0%Z -> 0%Z ≤ i_4 -> 0%Z ≤ i_7 -> i_4 < x_1 -> i_7 ≤ x_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i_7 -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a i_2 -> p_length_of_str_is t t_1 a i_5 -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_3 -> p_length_of_str_is t t_1 a_1 i_6 -> is_sint8 x -> p_char_in_str t_1 a_1 (t_1 (shift a i_4)) -> p_char_in_str t_1 a_1 x -> separated (shift a 0%Z) (1%Z + x_1) (shift a_1 0%Z) (1%Z + l_length t_1 a_1) -> (∀(i_8 : Z), 0%Z ≤ i_8 -> i_8 < i_7 -> ¬ p_char_in_str t_1 a_1 (t_1 (shift a i_8))) -> addr_le a a_2.
Admitted.
