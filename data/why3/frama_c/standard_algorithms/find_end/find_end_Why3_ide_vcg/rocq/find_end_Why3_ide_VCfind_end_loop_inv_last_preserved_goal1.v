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
Require Import find_end.Compound.Compound.
Require Import find_end.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (i_4 : Z) (i_2 : Z) (t_1 : addr -> Z) (a : addr) (i_5 : Z) (i_1 : Z) (i_3 : Z) (t : Z -> Z) (i : Z) : let a_2 : addr := shift a_1 i_4 in let x : Z := i_2 + i_4 in let x_1 : Z := i_2 + i_4 - 1%Z in p_equalranges_1' t_1 t_1 a_2 i_2 a = (¬ i_5 = 0%Z) -> 0%Z < i_2 -> i_1 < i_3 -> i_2 ≤ i_3 -> x ≤ i_3 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_4 ≤ 4294967294%Z -> i_3 ≤ 4294967295%Z + i_2 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> is_sint32 i_5 -> is_uint32 (1%Z + i_4) -> valid_rd t (shift a 0%Z) i_2 -> valid_rd t (shift a_1 0%Z) i_3 -> valid_rd t a_2 i_2 -> (if decide (i_5 = 0%Z) then i_1 = i else i_4 = i_1) -> (i < i_3 -> p_equalranges_1' t_1 t_1 (shift a_1 i) i_2 a) -> (i_3 = i -> ¬ p_hassubrange_1' t_1 a_1 0%Z x_1 a i_2) -> (i < i_3 -> ¬ p_hassubrange_1' t_1 a_1 (1%Z + i) x_1 a i_2) -> i_3 = i ∨ i + i_2 ≤ i_3 -> ¬ p_hassubrange_1' t_1 a_1 (1%Z + i_1) x a i_2.
Admitted.
