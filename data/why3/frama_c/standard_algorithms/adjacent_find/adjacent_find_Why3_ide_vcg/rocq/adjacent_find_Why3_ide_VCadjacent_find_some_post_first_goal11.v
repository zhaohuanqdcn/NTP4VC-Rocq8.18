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
Theorem goal11 (a : addr) (i_2 : Z) (t_1 : addr -> Z) (i_1 : Z) (t : Z -> Z) (i : Z) : let a_1 : addr := shift a i_2 in let x : Z := t_1 a_1 in let x_1 : Z := 1%Z + i_2 in let x_2 : Z := t_1 (shift a x_1) in let x_3 : Z := 1%Z + i_1 in region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> p_hasequalneighbors t_1 a i -> is_sint32 x -> valid_rd t (shift a 0%Z) i -> is_sint32 x_2 -> (if decide (2%Z ≤ i) then 0%Z ≤ i_1 ∧ i_1 < i ∧ i_1 ≤ 4294967294%Z ∧ ¬ p_hasequalneighbors t_1 a x_3 ∧ (if decide (2%Z + i_1 ≤ i) then i_2 = i_1 ∧ x_2 = x ∧ valid_rd t a_1 1%Z ∧ valid_rd t (shift a (to_uint32 x_1)) 1%Z else x_3 = i_2) else i_2 = i) -> ¬ p_hasequalneighbors t_1 a i_2.
Admitted.
