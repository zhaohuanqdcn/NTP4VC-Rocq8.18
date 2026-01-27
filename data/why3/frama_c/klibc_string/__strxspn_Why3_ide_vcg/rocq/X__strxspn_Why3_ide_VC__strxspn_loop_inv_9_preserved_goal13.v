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
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal13 (a_1 : addr) (i_1 : Z) (t_4 : addr -> Z) (i_6 : Z) (a : addr) (t_3 : Z -> Z) (i : Z) (i_2 : Z) (i_4 : Z) (i_3 : Z) (i_5 : Z) (t_1 : Z -> Z) (t_2 : Z -> Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_1 in let x : Z := t_4 a_2 in let x_1 : Z := l_length t_4 a_1 in ¬ x = 0%Z -> 0%Z ≤ i_1 -> i_6 ≤ i_1 -> 0%Z ≤ i_6 -> i_1 ≤ x_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t_3 -> sconst t_4 -> is_sint32 i -> is_sint32 i_1 -> is_sint8 (t_4 a_1) -> is_sint32 (1%Z + i_1) -> p_length_of_str_is t_3 t_4 a i_2 -> p_length_of_str_is t_3 t_4 a i_4 -> p_length_of_str_is t_3 t_4 a_1 i_3 -> p_length_of_str_is t_3 t_4 a_1 i_5 -> addr_le a_1 a_2 -> is_sint8 x -> addr_le a_2 (shift a_1 x_1) -> separated (shift a 0%Z) (1%Z + l_length t_4 a) (shift a_1 0%Z) (1%Z + x_1) -> i = 0%Z ∨ i = 1%Z -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 ≤ 255%Z -> t_1 i_7 = 0%Z) -> (∀(i_7 : Z), let x_2 : Z := t_2 i_7 in 0%Z ≤ i_7 -> i_7 ≤ 255%Z -> x_2 = 0%Z ∨ x_2 = 1%Z) -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 ≤ 255%Z -> i_7 < 0%Z ∨ 256%Z ≤ i_7 -> t_1 i_7 = t i_7) -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 < i_1 -> ¬ t_4 (shift a_1 i_7) = 0%Z) -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 < i_1 -> t_2 (t_4 (shift a_1 i_7)) = 1%Z) -> fun_updt t_2 (to_uint8 x) 1%Z (t_4 (shift a_1 i_6)) = 1%Z.
Admitted.
