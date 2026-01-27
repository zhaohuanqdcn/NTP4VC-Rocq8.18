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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal3 (a_1 : addr) (t_1 : addr -> Z) (a : addr) (t : Z -> Z) (i : Z) (i_3 : Z) (i_1 : Z) (i_2 : Z) : let a_2 : addr := shift a_1 0%Z in let x : Z := l_length t_1 a in let x_1 : Z := l_length t_1 a_1 in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a i_3 -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_2 -> valid_rw t a_2 (x + x_1) -> separated a_2 (1%Z + x_1) (shift a 0%Z) (1%Z + x) -> (∃(i_4 : Z), p_length_of_str_is t t_1 a_1 i_4).
Admitted.
