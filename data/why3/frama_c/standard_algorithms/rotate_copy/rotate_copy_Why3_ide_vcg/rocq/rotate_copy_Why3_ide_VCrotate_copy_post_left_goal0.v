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
Require Import rotate_copy.Compound.Compound.
Require Import rotate_copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (a : addr) (i_1 : Z) (i : Z) (t_1 : addr -> Z) (t_3 : addr -> Z) (t_2 : addr -> Z) (t : Z -> Z) : let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in let a_4 : addr := shift a_1 i_1 in let x : Z := i - i_1 in let a_5 : addr := shift a x in let a_6 : addr -> Z := havoc t_1 t_3 a_5 i_1 in let a_7 : addr -> Z := havoc t_2 a_6 a_3 x in i_1 ≤ i -> 0%Z ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i ≤ 4294967295%Z + i_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> valid_rd t a_2 i -> valid_rd t a_2 i_1 -> valid_rw t a_3 i -> valid_rd t a_4 x -> valid_rw t a_3 x -> separated a_2 i a_3 i -> separated a_4 x a 1%Z -> valid_rw t a_5 i_1 -> separated a_2 i_1 a_5 1%Z -> p_equalranges_1' a_6 t_3 a_1 i_1 a_5 -> p_equalranges_1' a_7 a_6 a_4 x a -> p_equalranges_3' a_7 t_3 a_1 0%Z i_1 a x.
Admitted.
