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
Require Import copy.Compound.Compound.
Require Import copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal5 (i_1 : Z) (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (t : Z -> Z) : let x : Z := 1%Z + i_1 in let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a_1 i_1 in let a_4 : addr := shift a 0%Z in let a_5 : addr := shift a i_1 in let a_6 : addr -> Z := havoc t_1 t_2 a_4 i in i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ 4294967294%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x -> valid_rd t a_2 i -> valid_rd t a_3 1%Z -> valid_rw t a_4 i -> valid_rw t a_5 1%Z -> separated a_2 i a 1%Z -> p_equalranges_1' a_6 t_2 a_1 i_1 a -> p_unchanged_1' a_6 t_2 a_1 i_1 i -> p_unchanged_1' (fun_updt a_6 a_5 (a_6 a_3)) t_2 a_1 x i.
Admitted.
