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
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t : Z -> Z) (i : Z) (i_1 : Z) : let x : Z := base a_1 in let x_1 : Z := offset a in let x_2 : Z := offset a_1 in let x_3 : Z := l_length t_1 a_1 in t_1 a = 0%Z -> x = base a -> region x ≤ 0%Z -> linked t -> sconst t_1 -> addr_le a_1 a -> p_length_of_str_is t t_1 a_1 i -> p_length_of_str_is t t_1 a_1 i_1 -> is_sint32 (x_1 - x_2) -> addr_le a (shift a_1 x_3) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x_2 < x_1 -> ¬ t_1 (shift a_1 i_2) = 0%Z) -> x_2 + x_3 = x_1.
Admitted.
