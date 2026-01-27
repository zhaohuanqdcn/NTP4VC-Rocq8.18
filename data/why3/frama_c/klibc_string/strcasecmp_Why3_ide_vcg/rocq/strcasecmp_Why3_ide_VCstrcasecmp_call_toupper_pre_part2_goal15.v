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
Require Import klibc_string.A_ToUpper.A_ToUpper.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic2.Axiomatic2.
Open Scope Z_scope.
Theorem goal15 (a : addr) (t_1 : addr -> Z) (a_2 : addr) (a_1 : addr) (t : Z -> Z) (i : Z) (i_3 : Z) (i_1 : Z) (i_2 : Z) : let x : Z := base a in let x_1 : Z := l_length t_1 a in let x_2 : Z := l_length t_1 a_2 in let x_3 : Z := offset a_1 in let x_4 : Z := offset a in let a_3 : addr := shift a_2 (x_3 - x_4) in let x_5 : Z := t_1 a_3 in base a_1 = x -> region x ≤ 0%Z -> region (base a_2) ≤ 0%Z -> linked t -> sconst t_1 -> addr_le a a_1 -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a i_3 -> p_length_of_str_is t t_1 a_2 i_1 -> p_length_of_str_is t t_1 a_2 i_2 -> addr_le a_1 (shift a x_1) -> separated (shift a_2 0%Z) (1%Z + x_2) (shift a 0%Z) (1%Z + x_1) -> addr_le a_2 a_3 -> addr_le a_3 (shift a_2 x_2) -> is_sint8 x_5 -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + x_4 < x_3 -> l_toupper (to_uint8 (t_1 (shift a_2 i_4))) = l_toupper (to_uint8 (t_1 (shift a i_4)))) -> x_5 ≤ 255%Z.
Admitted.
