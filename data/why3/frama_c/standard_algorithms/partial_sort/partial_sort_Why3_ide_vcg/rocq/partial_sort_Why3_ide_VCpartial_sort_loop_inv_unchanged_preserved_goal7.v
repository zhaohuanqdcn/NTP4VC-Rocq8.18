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
Require Import partial_sort.Compound.Compound.
Require Import partial_sort.Axiomatic.Axiomatic.
Require Import partial_sort.Axiomatic1.Axiomatic1.
Require Import partial_sort.A_Count.A_Count.
Open Scope Z_scope.
Theorem goal7 (i_3 : Z) (a : addr) (t_6 : addr -> Z) (t_7 : addr -> Z) (t_8 : addr -> Z) (i_2 : Z) (t_1 : addr -> Z) (t_5 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (i : Z) (t : Z -> Z) (t_3 : addr -> Z) (t_4 : addr -> Z) : let x : Z := 1%Z + i_3 in let a_1 : addr := shift a 0%Z in let x_1 : Z := t_6 a_1 in let a_2 : addr := shift a i_3 in let x_2 : Z := t_7 a_2 in let x_3 : Z := t_8 a_1 in let x_4 : Z := i_2 - 1%Z in let a_3 : addr := shift a x_4 in let x_5 : Z := t_7 a_3 in let a_4 : addr -> Z := havoc t_1 t_5 a_1 i_2 in let a_5 : addr -> Z := havoc t_2 a_4 a_1 i_1 in let a_6 : Z := a_5 a_1 in let a_7 : Z := a_5 a_2 in let m : addr -> Z := fun_updt (fun_updt t_7 a_2 i) a_3 x_2 in 0%Z < i_2 -> i_2 ≤ i_1 -> i_3 ≤ i_1 -> 0%Z ≤ i_2 -> i_3 < i_1 -> i_2 ≤ i_3 -> region (base a) ≤ 0%Z -> i_3 ≤ 4294967294%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 x -> is_sint32 x_1 -> is_sint32 x_2 -> is_sint32 x_3 -> valid_rd t a_1 1%Z -> valid_rd t a_2 1%Z -> valid_rw t a_1 i_1 -> valid_rw t a_1 i_2 -> is_sint32 x_5 -> is_sint32 (a_4 a_1) -> p_isheap a_4 a i_2 -> p_multisetunchanged_1' a_4 t_5 a 0%Z i_2 -> is_sint32 a_6 -> is_sint32 a_7 -> p_isheap a_5 a i_2 -> p_multisetunchanged_1' a_5 t_5 a 0%Z i_3 -> p_unchanged_1' a_5 t_5 a i_3 i_1 -> p_upperbound_1' a_5 a 0%Z i_2 a_6 -> p_lowerbound_1' a_5 a i_2 i_3 a_6 -> (if decide (a_7 < a_6) then x_5 = x_1 ∧ havoc t_3 t_6 a_1 i_2 = t_7 ∧ m a_2 = x_5 ∧ havoc t_4 m a_1 i_2 = t_8 ∧ a_5 = t_6 ∧ p_isheap t_8 a i_2 ∧ p_multisetunchanged_1' t_7 t_6 a 0%Z i_2 ∧ valid_rw t a_2 1%Z ∧ p_isheap t_7 a x_4 ∧ p_multisetunchanged_1' t_7 t_5 a 0%Z x ∧ p_maxelement t_7 a i_2 x_4 ∧ valid_rw t a_3 1%Z ∧ p_lowerbound_1' t_8 a i_2 x x_3 ∧ p_isheap m a x_4 ∧ p_multisetunchanged_1' t_8 m a 0%Z i_2 ∧ p_multisetunchanged_1' t_8 m a 0%Z x ∧ p_multisetunchanged_1' m t_7 a 0%Z x ∧ p_unchanged_1' m t_7 a x i_1 ∧ p_swappedinside m t_7 a x_4 i_3 x else a_5 = t_8) -> p_unchanged_1' t_8 t_5 a x i_1.
Admitted.
