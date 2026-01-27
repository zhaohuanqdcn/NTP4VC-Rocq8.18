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
Require Import upper_bound.Axiomatic.Axiomatic.
Require Import upper_bound.Compound.Compound.
Open Scope Z_scope.
Theorem goal11 (i_1 : Z) (i_4 : Z) (a : addr) (t_1 : addr -> Z) (i_2 : Z) (i_3 : Z) (t : Z -> Z) (i_5 : Z) (i : Z) : let x_1 : Z := i_1 - i_4 in let x_2 : Z := i_4 + to_uint32 (Z.rem (to_uint32 x_1) 2%Z) in let x_3 : Z := i_4 + Z.rem x_1 2%Z in let a_1 : addr := shift a x_3 in let x_4 : Z := t_1 a_1 in let x_5 : Z := Z.rem (i_2 - i_4) 2%Z in i_4 ≤ i_1 -> i_1 ≤ i_3 -> 0%Z ≤ i_4 -> i_4 < i_1 -> region (base a) ≤ 0%Z -> 0%Z ≤ x_2 -> i_1 ≤ 4294967295%Z + i_4 -> x_2 ≤ 4294967295%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> is_uint32 i_5 -> is_sint32 i -> p_sorted_1' t_1 a 0%Z i_3 -> p_upperbound_1' t_1 a 0%Z i_4 i -> p_strictlowerbound_1' t_1 a i_1 i_3 i -> valid_rd t (shift a 0%Z) i_3 -> is_uint32 x_3 -> is_sint32 x_4 -> valid_rd t a_1 1%Z -> (if decide (x_4 ≤ i) then i_2 = i_1 ∧ 1%Z + i_4 + x_5 = i_5 ∧ i_4 + x_5 ≤ 4294967294%Z else i_5 = i_4 ∧ i_5 + Z.rem (i_1 - i_5) 2%Z = i_2) -> i_2 + i_4 < i_1 + i_5.
Admitted.
