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
Require Import upper_bound.Axiomatic.Axiomatic.
Require Import upper_bound.Compound.Compound.
Open Scope Z_scope.
Theorem goal4 (i_1 : Z) (i_3 : Z) (a : addr) (t_1 : addr -> Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let x : Z := i_1 - i_3 in let x_1 : Z := i_3 + Z.rem x 2%Z in let a_1 : addr := shift a x_1 in let x_2 : Z := t_1 a_1 in let x_3 : Z := i_3 + to_uint32 (Z.rem (to_uint32 x) 2%Z) in i_3 ≤ i_1 -> i_1 ≤ i_2 -> 0%Z ≤ i_3 -> i_3 < i_1 -> region (base a) ≤ 0%Z -> i < x_2 -> 0%Z ≤ x_3 -> i_1 ≤ 4294967295%Z + i_3 -> x_3 ≤ 4294967295%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i -> p_sorted_1' t_1 a 0%Z i_2 -> p_upperbound_1' t_1 a 0%Z i_3 i -> p_strictlowerbound_1' t_1 a i_1 i_2 i -> valid_rd t (shift a 0%Z) i_2 -> is_uint32 x_1 -> is_sint32 x_2 -> valid_rd t a_1 1%Z -> p_strictlowerbound_1' t_1 a x_1 i_2 i.
Proof.
Admitted.
