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
Require Import find_first_of.Compound.Compound.
Require Import find_first_of.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal7 (t_1 : addr -> Z) (a : addr) (i_3 : Z) (a_1 : addr) (i_2 : Z) (i_1 : Z) (t : Z -> Z) (i : Z) : let x : Z := t_1 (shift a i_3) in let a_2 : addr := shift a_1 i_2 in let x_1 : Z := t_1 a_2 in i_2 ≤ i_1 -> 0%Z ≤ i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 x -> is_sint32 x_1 -> p_hasvalueof t_1 a_1 i_1 a i -> ¬ p_hasvalueof t_1 a_1 i_2 a i -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i_1 -> i_1 ≤ i_2 ∨ i_3 ≤ i ∧ 0%Z ≤ i_3 ∧ i_3 < i ∧ valid_rd t a_2 1%Z ∧ (p_hasvalue_1' t_1 a 0%Z i x_1 -> x_1 = x) ∧ (¬ p_hasvalue_1' t_1 a 0%Z i x_1 -> i_3 = i) ∧ (p_hasvalue_1' t_1 a 0%Z i x_1 -> ¬ p_hasvalue_1' t_1 a 0%Z i_3 x_1) -> p_hasvalue_1' t_1 a 0%Z i x_1.
Admitted.
