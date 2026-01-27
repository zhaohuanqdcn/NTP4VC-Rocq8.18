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
Theorem goal8 (a_1 : addr) (i_1 : Z) (a_2 : addr) (a_3 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (a : addr) (i : Z) (t : Z -> Z) : let x : Z := offset a_1 in let x_1 : Z := i_1 + x in let x_2 : Z := offset a_2 in let a_4 : addr := shift a_3 0%Z in let a_5 : addr -> Z := havoc t_1 t_2 a_4 i_1 in let a_6 : addr -> Z := fun_updt a_5 a (a_5 a_2) in ¬ x_1 = x_2 -> x_2 + offset a_3 = offset a + x -> 0%Z ≤ i -> x ≤ x_2 -> region (base a_1) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> x_2 ≤ x_1 -> i + to_uint64 (i_1 + x - 1%Z - x_2) < i_1 -> linked t -> sconst t_2 -> is_uint64 i_1 -> addr_le a_1 a_2 -> addr_le a_3 a -> addr_le a (shift a_3 i_1) -> addr_le a_2 (shift a_1 i_1) -> valid_rd t (shift a_1 0%Z) i_1 -> valid_rw t a_4 i_1 -> is_uint64 (i_1 + x - x_2) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x < x_2 -> a_5 (shift a_3 i_2) = a_5 (shift a_1 i_2)) -> a_6 (shift a_3 i) = a_6 (shift a_1 i).
Admitted.
