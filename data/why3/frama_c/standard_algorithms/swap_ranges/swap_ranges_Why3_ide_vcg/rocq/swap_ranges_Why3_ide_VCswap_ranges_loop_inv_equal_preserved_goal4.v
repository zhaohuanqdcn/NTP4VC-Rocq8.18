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
Require Import swap_ranges.Compound.Compound.
Require Import swap_ranges.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal4 (a : addr) (a_1 : addr) (t_2 : addr -> Z) (t_1 : addr -> Z) (t_3 : addr -> Z) (i_1 : Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let a_4 : addr -> Z := havoc t_2 (havoc t_1 t_3 a_2 i_1) a_3 i_1 in let a_5 : addr := shift a i_2 in let a_6 : addr := shift a_1 i_2 in let a_7 : Z := a_4 a_5 in let a_8 : addr -> Z := fun_updt (fun_updt a_4 a_5 i) a_6 a_7 in let a_9 : Z := a_8 a_5 in let a_10 : Z := a_4 a_6 in let x : Z := 1%Z + i_2 in a_9 = a_10 -> i_2 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 x -> valid_rw t a_2 i_1 -> valid_rw t a_5 1%Z -> valid_rw t a_3 i_1 -> valid_rw t a_6 1%Z -> separated a_3 i_1 a_2 i_1 -> is_sint32 a_7 -> is_sint32 a_10 -> is_sint32 a_9 -> p_equalranges_1' a_4 t_3 a i_2 a_1 -> p_equalranges_1' a_4 t_3 a_1 i_2 a -> p_unchanged_1' a_4 t_3 a i_2 i_1 -> p_unchanged_1' a_4 t_3 a_1 i_2 i_1 -> p_equalranges_1' a_8 t_3 a_1 x a.
Admitted.
