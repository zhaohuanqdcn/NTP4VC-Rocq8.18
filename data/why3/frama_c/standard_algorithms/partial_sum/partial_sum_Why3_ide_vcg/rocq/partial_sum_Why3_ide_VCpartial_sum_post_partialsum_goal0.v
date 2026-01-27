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
Require Import partial_sum.Compound.Compound.
Require Import partial_sum.Axiomatic1.Axiomatic1.
Require Import partial_sum.A_AccumulateAxiomatic.A_AccumulateAxiomatic.
Require Import partial_sum.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (a : addr) (t : Z -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (i_3 : Z) (t_3 : addr -> Z) (p : bool) (t_2 : addr -> Z) (t_1 : addr -> Z) : let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> valid_rd t a_2 i_1 -> valid_rw t a_3 i_1 -> p_accumulatebounds_1' t_3 a_1 (1%Z + i_1) 0%Z -> separated a_2 i_1 a_3 i_1 -> (if decide (0%Z < i_1) then p = false ∧ i_1 = i ∧ i_2 = i ∧ i_2 = i_1 ∧ t_2 (shift a (i_3 - 1%Z)) = l_accumulate_1' t_2 a_1 i_3 0%Z ∧ havoc t_1 (fun_updt t_3 a_3 (t_3 a_2)) (shift a 1%Z) (i_1 - 1%Z) = t_2 ∧ 0%Z < i_3 ∧ i_3 ≤ i_1 ∧ i_1 ≤ i_3 ∧ p_unchanged_1' t_2 t_3 a_1 0%Z i_1 ∧ p_partialsum t_2 a_1 i_3 a ∧ valid_rd t a_2 1%Z ∧ valid_rw t a_3 1%Z else t_3 = t_2) -> p_partialsum t_2 a_1 i_1 a.
Admitted.
