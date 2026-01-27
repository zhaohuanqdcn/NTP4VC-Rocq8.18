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
Require Import search.Compound.Compound.
Require Import search.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal5 (i : Z) (i_2 : Z) (a_1 : addr) (i_1 : Z) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) : let x : Z := i + i_2 in let a_2 : addr := shift a_1 i_2 in i ≤ i_1 -> x ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ 4294967295%Z + i -> x ≤ 1%Z + i_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i_1 -> valid_rd t a_2 i -> ¬ p_equalranges_1' t_1 t_1 a_2 i a -> ¬ p_hassubrange_1' t_1 a_1 0%Z (i + i_2 - 1%Z) a i -> i_2 ≤ 4294967294%Z.
Admitted.
