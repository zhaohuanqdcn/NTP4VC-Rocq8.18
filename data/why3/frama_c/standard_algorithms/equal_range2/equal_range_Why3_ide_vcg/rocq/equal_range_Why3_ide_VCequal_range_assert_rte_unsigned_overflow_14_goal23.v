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
Require Import equal_range2.Axiomatic.Axiomatic.
Require Import equal_range2.Compound.Compound.
Open Scope Z_scope.
Theorem goal23 (i_2 : Z) (i_5 : Z) (i_4 : Z) (i_1 : Z) (a : addr) (t_1 : addr -> Z) (i_3 : Z) (i : Z) (t : Z -> Z) : let x : Z := i_2 + i_5 in let x_2 : Z := i_4 - i_5 in let x_3 : Z := Z.rem x_2 2%Z in let x_4 : Z := i_5 + x_3 in let x_5 : Z := i_1 + i_5 + x_3 in let a_1 : addr := shift a x_4 in let x_6 : Z := t_1 a_1 in let x_7 : Z := i_5 + to_uint32 (Z.rem (to_uint32 x_2) 2%Z) in let a_2 : addr := shift a i_5 in let x_8 : Z := 1%Z + i_5 + x_3 in let a_3 : addr := shift a x_8 in let x_9 : Z := i_4 - 1%Z - i_5 - x_3 in 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_4 ≤ i_3 -> i_5 ≤ i_4 -> 0%Z ≤ i_5 -> i_5 < i_4 -> 0%Z ≤ x -> region (base a) ≤ 0%Z -> 0%Z ≤ x_3 -> i_2 ≤ x_3 -> x_4 < i_4 -> x_5 < i_4 -> x_6 ≤ i -> 0%Z ≤ x_7 -> i ≤ x_6 -> x ≤ 4294967295%Z -> i_4 ≤ 4294967295%Z + i_5 -> x_3 ≤ 4294967295%Z -> x_4 ≤ 4294967294%Z -> i_4 ≤ 4294967296%Z + i_5 + x_3 -> x_7 ≤ 4294967295%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> is_uint32 i_5 -> is_sint32 i -> p_sorted_1' t_1 a 0%Z i_3 -> p_strictupperbound_1' t_1 a 0%Z i_5 i -> p_strictlowerbound_1' t_1 a i_4 i_3 i -> valid_rd t (shift a 0%Z) i_3 -> valid_rd t a_2 x_3 -> p_sorted_1' t_1 a_2 0%Z x_3 -> is_uint32 x_4 -> is_uint32 x_8 -> is_sint32 x_6 -> valid_rd t a_1 1%Z -> valid_rd t a_3 x_9 -> p_sorted_1' t_1 a_3 0%Z x_9 -> p_strictupperbound_1' t_1 a_2 0%Z i_2 x_6 -> p_strictlowerbound_1' t_1 a_3 i_1 x_9 x_6 -> p_lowerbound_1' t_1 a_2 i_2 x_3 x_6 -> p_upperbound_1' t_1 a_3 0%Z i_1 x_6 -> x_5 ≤ 4294967294%Z.
Proof.
Admitted.
