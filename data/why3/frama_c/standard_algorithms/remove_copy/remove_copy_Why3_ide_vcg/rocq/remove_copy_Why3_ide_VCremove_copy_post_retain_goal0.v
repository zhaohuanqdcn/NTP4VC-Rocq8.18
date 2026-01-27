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
Require Import remove_copy.Axiomatic1.Axiomatic1.
Require Import remove_copy.A_Count.A_Count.
Require Import Why3.Cint.Cint.
Require Import remove_copy.Compound.Compound.
Require Import remove_copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (t_2 : addr -> Z) (a_1 : addr) (i_2 : Z) (i : Z) (a : addr) (t_1 : addr -> Z) (i_1 : Z) (t : Z -> Z) : let x : Z := l_count_1' t_2 a_1 0%Z i_2 i in let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in let x_1 : Z := i_2 - x in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i_1 in i_2 ≤ i_1 -> i_1 ≤ i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> x ≤ i_2 -> 0%Z ≤ x -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> valid_rd t a_2 i_1 -> valid_rw t a_3 i_1 -> separated a_2 i_1 a 1%Z -> is_uint32 x_1 -> ¬ p_hasvalue_1' a_4 a 0%Z x_1 i -> p_unchanged_1' a_4 t_2 a_1 i_2 i_1 -> p_unchanged_1' a_4 t_2 a x_1 i_1 -> p_multisetretainrest_1' a_4 t_2 a_1 0%Z i_2 a 0%Z x_1 i -> p_multisetretainrest_1' (havoc t_1 t_2 a_3 i_2) t_2 a_1 0%Z i_2 a 0%Z x_1 i.
Admitted.
