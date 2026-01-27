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
Theorem goal24 (a_2 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (a_1 : addr) (a : addr) (t : Z -> Z) : let a_3 : addr := shift a_2 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i in let a_5 : addr -> Z := fun_updt a_4 a_2 (a_4 a_1) in let x : Z := to_uint64 (i - 1%Z) in let x_1 : Z := i - 1%Z - x in let a_6 : Z := a_5 (shift a_2 x_1) in let a_7 : Z := a_5 (shift a x_1) in ¬ i = 0%Z -> offset a_1 = offset a -> a_6 = a_7 -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> linked t -> sconst t_2 -> is_uint64 i -> addr_le a a_1 -> addr_le a_2 a -> addr_le a_2 a_2 -> addr_le a_1 (shift a i) -> addr_le a_2 (shift a_2 i) -> valid_rd t (shift a 0%Z) i -> valid_rw t a_3 i -> is_sint8 a_7 -> is_sint8 a_6 -> (∀(i_1 : Z), let a_8 : addr := shift a i_1 in 0%Z ≤ i_1 -> i_1 < i -> a_4 a_8 = t_2 a_8) -> x < i.
Admitted.
