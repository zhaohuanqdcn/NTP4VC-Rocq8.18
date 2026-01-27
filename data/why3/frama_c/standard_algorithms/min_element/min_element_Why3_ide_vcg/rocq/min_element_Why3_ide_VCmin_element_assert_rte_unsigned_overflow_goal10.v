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
Require Import min_element.Compound.Compound.
Require Import min_element.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal10 (a : addr) (i_1 : Z) (t_1 : addr -> Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let a_2 : addr := shift a i_1 in let x : Z := t_1 a_2 in let a_3 : addr := shift a i_2 in 0%Z < i -> i_2 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> 0%Z ≤ i_2 -> i_2 < i -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 (t_1 a_1) -> is_sint32 x -> is_sint32 (t_1 a_3) -> valid_rd t a_1 i -> valid_rd t a_2 1%Z -> valid_rd t a_3 1%Z -> p_lowerbound_1' t_1 a 0%Z i_2 x -> p_strictlowerbound_1' t_1 a 0%Z i_1 x -> i_2 ≤ 4294967294%Z.
Admitted.
