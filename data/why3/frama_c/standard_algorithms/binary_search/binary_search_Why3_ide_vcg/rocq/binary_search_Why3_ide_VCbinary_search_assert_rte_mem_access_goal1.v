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
Require Import binary_search.Axiomatic.Axiomatic.
Require Import binary_search.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (a : addr) (i_2 : Z) (i_1 : Z) (t : Z -> Z) (i : Z) (t_1 : addr -> Z) : let a_1 : addr := shift a i_2 in i_2 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> p_sorted_1' t_1 a 0%Z i_1 -> is_sint32 (t_1 a_1) -> p_lowerbound_1' t_1 a i_2 i_1 i -> p_strictupperbound_1' t_1 a 0%Z i_2 i -> valid_rd t (shift a 0%Z) i_1 -> valid_rd t a_1 1%Z.
Admitted.
