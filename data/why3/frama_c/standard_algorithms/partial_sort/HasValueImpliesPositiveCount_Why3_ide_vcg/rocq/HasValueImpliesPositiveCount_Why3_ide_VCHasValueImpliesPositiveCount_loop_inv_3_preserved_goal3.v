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
Require Import partial_sort.Axiomatic1.Axiomatic1.
Require Import partial_sort.A_Count.A_Count.
Require Import partial_sort.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal3 (i_2 : Z) (t : addr -> Z) (a : addr) (i_1 : Z) (i : Z) (i_3 : Z) : let x : Z := 1%Z + i_2 in let x_1 : Z := t (shift a i_2) in i_1 ≤ i -> i_2 ≤ i -> i_2 < i -> i_1 ≤ i_2 -> i_3 ≤ i_2 -> i_1 ≤ i_3 -> region (base a) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> i_1 ≤ x -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 x -> is_sint32 (t (shift a i_1)) -> is_sint32 x_1 -> is_sint32 (t (shift a x)) -> p_hasvalue_1' t a i_1 i x_1 -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < i_2 -> 0%Z < l_count_1' t a i_1 i (t (shift a i_4))) -> (∀(i_4 : Z), is_sint32 i_4 -> l_count_1' t a i_1 x i_4 + l_count_1' t a x i i_4 = l_count_1' t a i_1 i i_4) -> (∀(i_4 : Z), let x_2 : Z := l_count_1' t a i_1 i_2 i_4 in is_sint32 i_4 -> 0%Z ≤ x_2 ∧ i_1 + x_2 ≤ i_2) -> (∀(i_4 : Z), let x_2 : Z := l_count_1' t a x i i_4 in is_sint32 i_4 -> 0%Z ≤ x_2 ∧ i_2 + x_2 < i) -> 0%Z < l_count_1' t a i_1 i (t (shift a i_3)).
Admitted.
