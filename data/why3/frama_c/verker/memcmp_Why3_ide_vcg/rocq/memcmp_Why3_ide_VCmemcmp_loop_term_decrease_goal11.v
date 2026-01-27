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
Theorem goal11 (t_1 : addr -> Z) (a_22 : addr) (a_21 : addr) (a_16 : addr) (i : Z) (a_5 : addr) (a_4 : addr) (a_3 : addr) (a_2 : addr) (a_11 : addr) (a_10 : addr) (a_9 : addr) (a_8 : addr) (a_15 : addr) (a_14 : addr) (a_23 : addr) (a_24 : addr) (t : Z -> Z) (a_17 : addr) (a_19 : addr) (a : addr) (a_1 : addr) (a_6 : addr) (a_7 : addr) (a_18 : addr) (a_20 : addr) (a_13 : addr) (a_12 : addr) : let x : Z := t_1 a_22 in let x_1 : Z := t_1 a_21 in let x_2 : Z := offset a_21 in let x_3 : Z := offset a_16 in let x_4 : Z := i + x_2 - x_3 in x = x_1 -> (base a_5 = base a_4) = (base a_3 = base a_2) -> (base a_11 = base a_10) = (base a_9 = base a_8) -> offset a_15 + offset a_22 = offset a_14 + x_2 -> 0%Z < i -> 0%Z ≤ i -> x_3 ≤ x_2 -> region (base a_23) ≤ 0%Z -> region (base a_24) ≤ 0%Z -> linked t -> is_uint64 i -> addr_le a_17 a_21 -> addr_le a_19 a_22 -> is_uint8 x_1 -> is_uint8 x -> is_uint64 x_4 -> valid_rd t (shift a 0%Z) x_4 -> valid_rd t (shift a_1 0%Z) x_4 -> valid_rd t (shift a_6 0%Z) x_4 -> valid_rd t (shift a_7 0%Z) x_4 -> addr_le a_21 (shift a_18 x_4) -> addr_le a_22 (shift a_20 x_4) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 + x_3 < x_2 -> t_1 (shift a_13 i_1) = t_1 (shift a_12 i_1)) -> to_uint64 (i - 1%Z) < i.
Admitted.
