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
Require Import adjacent_find.Compound.Compound.
Require Import adjacent_find.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal8 (i_1 : Z) (i_2 : Z) (a : addr) (i : Z) (t : Z -> Z) (t_1 : addr -> Z) : let x : Z := 1%Z + i_1 in let x_1 : Z := 1%Z + i_2 in let a_1 : addr := shift a i_2 in 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> 2%Z ≤ i -> i_1 ≤ 4294967294%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> ¬ p_hasequalneighbors t_1 a i -> is_sint32 (t_1 (shift a i_1)) -> valid_rd t (shift a 0%Z) i -> ¬ p_hasequalneighbors t_1 a x -> is_sint32 (t_1 (shift a x)) -> (if decide (2%Z + i_1 ≤ i) then i_2 = i_1 ∧ t_1 (shift a x_1) = t_1 a_1 ∧ valid_rd t a_1 1%Z ∧ valid_rd t (shift a (to_uint32 x_1)) 1%Z else x = i_2) -> i_2 = i.
Admitted.
