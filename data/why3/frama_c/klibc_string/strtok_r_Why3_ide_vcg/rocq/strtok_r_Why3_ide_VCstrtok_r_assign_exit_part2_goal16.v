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
Open Scope Z_scope.
Theorem goal16 (a : addr) (t_1 : addr -> Z) (a_2 : addr) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (i : Z) (i_1 : Z) (i_2 : Z) : let a_3 : addr := shift a 0%Z in let x : Z := 1%Z + l_length t_1 a in let a_4 : addr := shift a_2 0%Z in let x_1 : Z := 1%Z + l_length t_1 a_2 in ¬ Mk_addr 0%Z 0%Z = a -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> framed t_2 -> linked t -> sconst t_1 -> valid_rw t a_1 1%Z -> valid_rw t (t_2 a_1) 1%Z -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a_2 i_1 -> p_length_of_str_is t t_1 a_2 i_2 -> separated a_1 1%Z a_3 x -> separated a_1 1%Z a_4 x_1 -> ¬ separated a_3 x a_4 x_1.
Admitted.
