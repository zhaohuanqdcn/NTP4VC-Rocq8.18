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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import verker.A_CheckBytes8.A_CheckBytes8.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal3 (a_1 : addr) (i : Z) (a : addr) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := offset a_1 in let x_1 : Z := i + x in let x_2 : Z := offset a in let x_3 : Z := t_1 a in let x_4 : Z := i + x - x_2 in let a_2 : addr := shift a_1 i in let a_3 : addr := shift a 1%Z in ¬ x_1 = x_2 -> l_check_bytes8 t_1 a x_3 x_4 = l_check_bytes8 t_1 a_1 x_3 i -> x ≤ x_2 -> region (base a_1) ≤ 0%Z -> x_2 ≤ x_1 -> linked t -> is_uint32 i -> addr_le a_1 a -> is_uint8 x_3 -> addr_le a a_2 -> valid_rd t (shift a_1 0%Z) i -> is_uint32 x_4 -> (∀(a_4 : addr), addr_lt a_4 a -> addr_le a_1 a_4 -> x_3 = t_1 a_4) -> addr_le a_1 a_3 ∧ addr_le a_3 a_2.
Admitted.
