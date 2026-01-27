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
Require Import klibc_stdio.Axiomatic.Axiomatic.
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.A_Length.A_Length.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal19 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (t : Z -> Z) (i : Z) (i_1 : Z) : let x : Z := t_1 a in let x_1 : Z := base a_1 in ¬ x = 0%Z -> ¬ x = 43%Z -> ¬ x = 97%Z -> ¬ x = 101%Z -> ¬ x = 114%Z -> ¬ x = 119%Z -> ¬ x = 120%Z -> x_1 = base a -> region x_1 ≤ 0%Z -> linked t -> sconst t_1 -> addr_le a_1 a -> is_sint8 x -> p_length_of_str_is t t_1 a_1 i -> p_length_of_str_is t t_1 a_1 i_1 -> addr_le a (shift a_1 (l_length t_1 a_1)) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + offset a_1 < offset a -> ¬ t_1 (shift a_1 i_2) = 0%Z) -> addr_le a_1 (shift a 1%Z).
Admitted.
