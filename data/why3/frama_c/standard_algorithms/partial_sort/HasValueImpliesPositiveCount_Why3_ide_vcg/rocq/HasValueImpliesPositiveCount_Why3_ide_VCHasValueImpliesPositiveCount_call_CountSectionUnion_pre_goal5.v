From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import partial_sort.Compound.Compound.
Require Import partial_sort.Axiomatic1.Axiomatic1.
Require Import partial_sort.A_Count.A_Count.
Require Import partial_sort.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal5 (t : addr -> Z) (a : addr) (i_2 : Z) (i_1 : Z) (i : Z) : let x : Z := t (shift a i_2) in let x_1 : Z := 1%Z + i_2 in i_1 ≤ i -> i_2 ≤ i -> i_2 < i -> i_1 ≤ i_2 -> region (base a) ≤ 0%Z -> i_2 ≤ 4294967294%Z -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 (t (shift a i_1)) -> is_sint32 x -> p_hasvalue_1' t a i_1 i x -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < i_2 -> 0%Z < l_count_1' t a i_1 i (t (shift a i_3))) -> (∀(i_3 : Z), let x_2 : Z := l_count_1' t a i_1 i_2 i_3 in is_sint32 i_3 -> 0%Z ≤ x_2 ∧ i_1 + x_2 ≤ i_2) -> (∀(i_3 : Z), let x_2 : Z := l_count_1' t a x_1 i i_3 in is_sint32 i_3 -> 0%Z ≤ x_2 ∧ i_2 + x_2 < i) -> i_1 ≤ x_1.
Proof.
Admitted.
