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
Require Import adjacent_difference.Axiomatic1.Axiomatic1.
Require Import adjacent_difference.Compound.Compound.
Require Import adjacent_difference.A_DifferenceAxiomatic.A_DifferenceAxiomatic.
Require Import adjacent_difference.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal4 (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let a_4 : addr -> Z := havoc t_1 (fun_updt t_2 a_2 (t_2 a_3)) (shift a 1%Z) (i_1 - 1%Z) in let a_5 : addr := shift a i_2 in let a_6 : addr -> Z := fun_updt a_4 a_5 i in let a_7 : addr := shift a_1 i_2 in let a_8 : Z := a_4 a_7 in let a_9 : addr := shift a_1 (to_uint32 (i_2 - 1%Z)) in let a_10 : Z := a_4 a_9 in let x : Z := 1%Z + i_2 in l_difference a_6 a_1 i_2 = i -> 0%Z < i_1 -> 0%Z < i_2 -> i_2 ≤ i_1 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> a_8 ≤ 2147483647%Z + a_10 -> a_10 ≤ 2147483648%Z + a_8 -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> p_adjacentdifferencebounds t_2 a_1 i_1 -> is_uint32 x -> valid_rd t a_3 1%Z -> valid_rd t a_3 i_1 -> valid_rd t a_7 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_2 i_1 -> valid_rw t a_5 1%Z -> separated a_3 i_1 a_2 i_1 -> valid_rd t a_9 1%Z -> is_sint32 a_8 -> is_sint32 a_10 -> p_unchanged_1' a_4 t_2 a_1 0%Z i_1 -> p_adjacentdifference a_4 a_1 i_2 a -> p_unchanged_1' a_6 a_4 a 0%Z i_2 -> p_adjacentdifference a_6 a_1 x a.
Admitted.
