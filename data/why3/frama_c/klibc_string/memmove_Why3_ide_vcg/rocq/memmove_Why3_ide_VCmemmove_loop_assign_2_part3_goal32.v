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
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal32 (a : addr) (i_1 : Z) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a i_1 in let a_3 : addr := shift a_1 i_1 in let x : Z := i_1 - 1%Z in let a_4 : addr := shift a_1 x in let a_5 : addr -> Z := havoc t_1 t_2 a_3 (i - i_1) in let x_1 : Z := to_uint32 x in ¬ i_1 = 0%Z -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> ¬ addr_lt a_1 a -> addr_le a a_2 -> addr_le a_1 a_3 -> addr_le a_2 (shift a i) -> addr_le a_3 (shift a_1 i) -> valid_rw t (shift a 0%Z) i -> valid_rw t (shift a_1 0%Z) i -> ¬ invalid t a_4 1%Z -> (∀(i_2 : Z), i_2 < i -> i_1 ≤ i_2 -> a_5 (shift a_1 i_2) = t_2 (shift a i_2)) -> (∀(i_2 : Z), let a_6 : addr := shift a_1 i_2 in 0%Z ≤ i_2 -> i_2 < i_1 -> a_5 a_6 = t_2 a_6) -> included a_4 1%Z (shift a_1 x_1) (i - x_1).
Admitted.
