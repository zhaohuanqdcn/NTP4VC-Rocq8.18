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
Theorem goal11 (i : Z) (i_1 : Z) (a_1 : addr) (i_3 : Z) (i_2 : Z) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) : let x : Z := i + i_1 in let a_2 : addr := shift a_1 i in ¬ i_3 = 0%Z -> i_1 ≤ i_2 -> x ≤ i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 ≤ 4294967295%Z + i_1 -> x ≤ 1%Z + i_2 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i_3 -> valid_rd t (shift a 0%Z) i_1 -> valid_rd t (shift a_1 0%Z) i_2 -> valid_rd t a_2 i_1 -> ¬ p_hassubrange_1' t_1 a_1 0%Z i_2 a i_1 -> p_equalranges_1' t_1 t_1 a_2 i_1 a -> ¬ p_hassubrange_1' t_1 a_1 0%Z (i + i_1 - 1%Z) a i_1 -> i_2 = i.
Admitted.
