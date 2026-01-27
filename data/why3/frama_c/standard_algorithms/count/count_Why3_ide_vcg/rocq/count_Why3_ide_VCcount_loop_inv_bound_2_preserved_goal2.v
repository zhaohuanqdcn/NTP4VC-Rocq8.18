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
Require Import count.Axiomatic1.Axiomatic1.
Require Import count.A_Count.A_Count.
Require Import Why3.Cint.Cint.
Require Import count.Compound.Compound.
Require Import count.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal2 (t_1 : addr -> Z) (a : addr) (i_2 : Z) (i : Z) (i_1 : Z) (t : Z -> Z) (i_3 : Z) (i_4 : Z) : let x : Z := l_count_1' t_1 a 0%Z i_2 i in let x_1 : Z := 1%Z + i_2 in let a_1 : addr := shift a i_2 in let x_2 : Z := t_1 a_1 in i_2 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> x ≤ i_2 -> 0%Z ≤ x -> i_2 ≤ 4294967294%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> is_sint32 i -> is_uint32 x_1 -> is_sint32 x_2 -> valid_rd t (shift a 0%Z) i_1 -> valid_rd t a_1 1%Z -> is_uint32 x -> (if decide (x_2 = i) then 1%Z + i_3 = i_4 ∧ l_count_1' t_1 a 0%Z i_2 x_2 = i_3 ∧ i_3 ≤ 4294967294%Z else x = i_4) -> 0%Z ≤ i_4 ∧ i_4 ≤ x_1.
Admitted.
