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
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal14 (a_1 : addr) (i : Z) (i_1 : Z) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) (i_4 : Z) (i_2 : Z) (i_3 : Z) : let a_2 : addr := shift a_1 0%Z in let x : Z := i - i_1 in let a_3 : addr := shift a x in let a_4 : addr := shift a_1 x in ¬ i = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint8 i_4 -> is_uint32 i -> is_uint32 i_1 -> p_length_of_str_is t t_1 a i_2 -> p_length_of_str_is t t_1 a i_3 -> valid_rw t a_2 i_1 -> separated (shift a 0%Z) i_1 a_2 i_1 -> addr_le a a_3 -> addr_le a_1 a_4 -> addr_le a_3 (shift a i_1) -> addr_le a_4 (shift a_1 i_1) -> ¬ invalid t a_4 1%Z -> (¬ i_1 = i -> ¬ i_4 = 0%Z) -> included a_4 1%Z a_2 i_1.
Admitted.
