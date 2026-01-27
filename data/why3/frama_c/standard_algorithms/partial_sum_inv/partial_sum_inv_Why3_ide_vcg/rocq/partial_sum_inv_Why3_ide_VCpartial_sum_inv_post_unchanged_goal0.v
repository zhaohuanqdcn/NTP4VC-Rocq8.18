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
Require Import partial_sum_inv.Compound.Compound.
Require Import partial_sum_inv.Axiomatic1.Axiomatic1.
Require Import partial_sum_inv.A_AccumulateAxiomatic.A_AccumulateAxiomatic.
Require Import partial_sum_inv.Axiomatic.Axiomatic.
Require Import partial_sum_inv.Axiomatic2.Axiomatic2.
Require Import partial_sum_inv.A_DifferenceAxiomatic.A_DifferenceAxiomatic.
Open Scope Z_scope.
Theorem goal0 (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t_3 : addr -> Z) (i : Z) (t_2 : addr -> Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let a_4 : addr -> Z := havoc t_1 t_3 a_2 i in let a_5 : addr -> Z := havoc t_2 a_4 a_3 i in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> valid_rd t a_2 i -> valid_rd t a_3 i -> valid_rw t a_2 i -> valid_rw t a_3 i -> p_accumulatebounds_1' t_3 a_1 (1%Z + i) 0%Z -> separated a_2 i a_3 i -> separated a_3 i a_2 i -> p_adjacentdifferencebounds a_4 a i -> p_unchanged_1' a_4 t_3 a_1 0%Z i -> p_partialsum a_4 a_1 i a -> p_unchanged_1' a_5 a_4 a 0%Z i -> p_adjacentdifference a_5 a i a_1 -> p_unchanged_1' a_5 t_3 a_1 0%Z i.
Admitted.
