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
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal5 (a_1 : addr) (a : addr) (i : Z) (a_2 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (t : Z -> Z) : let x : Z := offset a_1 in let x_1 : Z := offset a in let x_2 : Z := i + x_1 in let a_3 : addr := shift a_2 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i in let a_5 : addr -> Z := fun_updt a_4 a_2 (a_4 a_1) in let x_4 : Z := i - 1%Z - to_uint64 (i + x_1 - 1%Z - x) in let a_6 : Z := a_5 (shift a_2 x_4) in let a_7 : Z := a_5 (shift a x_4) in let a_8 : addr := shift a i in let a_9 : addr := shift a_1 1%Z in x = x_1 -> ¬ x_2 = x -> a_6 = a_7 -> x_1 ≤ x -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> x ≤ x_2 -> linked t -> sconst t_2 -> is_uint64 i -> addr_le a a_1 -> addr_le a_2 a -> addr_le a_2 a_2 -> addr_le a_1 a_8 -> addr_le a_2 (shift a_2 i) -> valid_rd t (shift a 0%Z) i -> valid_rw t a_3 i -> is_uint64 (i + x_1 - x) -> is_sint8 a_7 -> is_sint8 a_6 -> (∀(i_1 : Z), let a_10 : addr := shift a i_1 in i_1 < i -> x ≤ i_1 + x_1 -> a_4 a_10 = t_2 a_10) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 + x_1 < x -> a_4 (shift a_2 i_1) = t_2 (shift a i_1)) -> addr_le a a_9 ∧ addr_le a_9 a_8.
Admitted.
