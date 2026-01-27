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
Theorem goal14 (a : addr) (a_1 : addr) (i_1 : Z) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let a_4 : addr := shift a 1%Z in let x : Z := i_1 - 1%Z in let a_5 : addr -> Z := havoc t_1 (fun_updt t_2 a_2 (t_2 a_3)) a_4 x in let a_6 : addr := shift a i_2 in let a_7 : addr -> Z := fun_updt a_5 a_6 i in let a_8 : addr := shift a_1 i_2 in let a_9 : Z := a_5 a_8 in let a_10 : addr := shift a_1 (to_uint32 (i_2 - 1%Z)) in let a_11 : Z := a_5 a_10 in l_difference a_7 a_1 i_2 = i -> 0%Z < i_1 -> 0%Z < i_2 -> i_2 ≤ i_1 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> a_9 ≤ 2147483647%Z + a_11 -> a_11 ≤ 2147483648%Z + a_9 -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> p_adjacentdifferencebounds t_2 a_1 i_1 -> valid_rd t a_3 1%Z -> valid_rd t a_3 i_1 -> valid_rd t a_8 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_2 i_1 -> valid_rw t a_6 1%Z -> ¬ invalid t a_6 1%Z -> separated a_3 i_1 a_2 i_1 -> valid_rd t a_10 1%Z -> is_sint32 a_9 -> is_sint32 a_11 -> p_unchanged_1' a_5 t_2 a_1 0%Z i_1 -> p_adjacentdifference a_5 a_1 i_2 a -> p_unchanged_1' a_7 a_5 a 0%Z i_2 -> included a_6 1%Z a_4 x.
Admitted.
