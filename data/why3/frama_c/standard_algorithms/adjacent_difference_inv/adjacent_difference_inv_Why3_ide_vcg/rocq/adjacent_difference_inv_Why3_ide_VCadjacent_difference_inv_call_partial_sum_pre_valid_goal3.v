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
Require Import adjacent_difference_inv.Axiomatic2.Axiomatic2.
Require Import adjacent_difference_inv.A_DifferenceAxiomatic.A_DifferenceAxiomatic.
Require Import adjacent_difference_inv.Compound.Compound.
Require Import adjacent_difference_inv.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal3 (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> p_adjacentdifferencebounds t_2 a_1 i -> valid_rd t a_2 i -> valid_rw t a_3 i -> valid_rw t a_2 i -> p_adjacentdifferencebounds t_2 a_1 (1%Z + i) -> separated a_2 i a_3 i -> p_unchanged_1' a_4 t_2 a_1 0%Z i -> p_adjacentdifference a_4 a_1 i a -> valid_rd t a_3 i.
Admitted.
