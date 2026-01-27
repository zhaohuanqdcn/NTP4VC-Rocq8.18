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
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal12 (t_1 : addr -> Z) (a_12 : addr) (a_5 : addr) (a_11 : addr) (i : Z) (i_1 : Z) (a_10 : addr) (t : Z -> Z) (a_13 : addr) (a_9 : addr) (a_2 : addr) (a_6 : addr) (a_8 : addr) (a : addr) (a_1 : addr) (a_3 : addr) (a_7 : addr) (a_4 : addr) : let x : Z := t_1 a_12 in let x_1 : Z := offset a_5 in let x_2 : Z := offset a_11 in let x_3 : Z := i + x_2 - x_1 in x = to_uint8 i_1 -> 0%Z ≤ i -> x_1 ≤ x_2 -> region (base a_10) ≤ 0%Z -> linked t -> is_sint32 i_1 -> is_uint64 i -> addr_lt a_13 a_9 -> addr_le a_2 a_12 -> addr_le a_6 a_11 -> addr_le a_8 a_13 -> is_uint64 x_3 -> valid_rd t (shift a 0%Z) x_3 -> valid_rd t (shift a_1 0%Z) x_3 -> addr_lt a_12 (shift a_3 x_3) -> addr_le a_11 (shift a_7 x_3) -> i = 0%Z ∨ x = t_1 a_11 -> (∀(a_14 : addr), addr_lt a_14 a_11 -> addr_le a_4 a_14 -> ¬ x = t_1 a_14) -> ¬ t_1 a_13 = x.
Admitted.
