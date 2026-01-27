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
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal1 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (i_2 : Z) (t : Z -> Z) (i : Z) (i_1 : Z) : let x : Z := t_1 a in let x_1 : Z := base a_1 in let x_2 : Z := to_sint8 i_2 in let a_2 : addr := shift a_1 (l_length t_1 a_1) in ¬ x = 0%Z -> x_1 = base a -> ¬ x = x_2 -> region x_1 ≤ 0%Z -> - 128%Z ≤ i_2 -> i_2 ≤ 127%Z -> linked t -> sconst t_1 -> is_sint32 i_2 -> addr_le a_1 a -> is_sint8 x -> p_length_of_str_is t t_1 a_1 i -> p_length_of_str_is t t_1 a_1 i_1 -> addr_le a a_2 -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 + offset a_1 < offset a -> ¬ t_1 (shift a_1 i_3) = x_2) -> addr_le (shift a 1%Z) a_2.
Admitted.
