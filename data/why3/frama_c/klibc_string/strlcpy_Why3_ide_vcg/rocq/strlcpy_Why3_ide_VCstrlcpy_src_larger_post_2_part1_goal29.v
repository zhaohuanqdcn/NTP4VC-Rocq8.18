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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal29 (a_2 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (a : addr) (i_3 : Z) (a_1 : addr) (i_1 : Z) (i_2 : Z) (t : Z -> Z) : let a_3 : addr := shift a_2 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i in let a_5 : addr := shift a i_3 in let x : Z := offset a_2 in let x_1 : Z := offset a_1 in let x_2 : Z := l_length t_2 a in let x_3 : Z := l_length a_4 a in let x_4 : Z := 2%Z + i_3 in a_4 a_5 = 0%Z -> 0%Z < i -> i ≤ i_1 -> i ≤ i_2 -> 0%Z ≤ i_3 -> x ≤ x_1 -> i < x_2 -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> x_1 ≤ i + x -> i_3 ≤ x_3 -> linked t -> sconst t_2 -> is_uint32 i_3 -> is_sint32 i -> addr_le a_2 a_1 -> p_length_of_str_is t t_2 a i_1 -> p_length_of_str_is t t_2 a i_2 -> addr_le a a_5 -> addr_le a_1 (shift a_2 i) -> valid_rw t a_3 i -> separated (shift a 0%Z) (1%Z + x_2) a_3 i -> addr_le a_5 (shift a x_3) -> (x_4 ≤ i -> shift a_2 i_3 = a_1) -> (x_4 ≤ i -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_3 -> a_4 (shift a_2 i_4) = a_4 (shift a i_4))) -> l_length (fun_updt a_4 a_1 0%Z) a = to_sint32 i_3.
Admitted.
