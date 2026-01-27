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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal10 (t_1 : addr -> Z) (a : addr) (a_2 : addr) (a_1 : addr) (i_4 : Z) (i_3 : Z) (t : Z -> Z) (i_1 : Z) (i_2 : Z) (i : Z) : let x : Z := t_1 a in let x_1 : Z := t_1 a_2 in let x_2 : Z := base a_1 in let x_3 : Z := base a in let x_4 : Z := offset a_1 in let x_5 : Z := offset a in let x_6 : Z := i_4 + x_4 in let x_7 : Z := offset a_2 in let x_8 : Z := l_length t_1 a_1 in let a_3 : addr := shift a_1 x_8 in let a_4 : addr := shift a_1 i_3 in let x_9 : Z := t_1 a_4 in ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = 0%Z -> ¬ x_1 = x -> x_2 = x_3 -> base a_2 = x_3 -> x_4 ≤ x_5 -> region x_2 ≤ 0%Z -> x_6 ≤ x_5 -> x_7 < x_6 -> x_5 ≤ x_4 + x_8 -> - 128%Z ≤ x_1 -> x_1 ≤ 127%Z -> linked t -> sconst t_1 -> addr_le a_1 a -> addr_le a_1 a_2 -> is_sint8 x -> is_sint8 x_1 -> is_sint8 (t_1 (Mk_addr 0%Z 0%Z)) -> is_sint32 x_1 -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_2 -> addr_le a a_3 -> addr_le a_2 a_3 -> (x_9 = x_1 -> 0%Z ≤ i_3 -> i_3 + x_4 < x_5 -> (∀(i_5 : Z), ¬ x_9 = x_1 ∧ i_3 < i_5 ∧ i_5 + x_4 < x_5) -> a_4 = a_2) -> t_1 (shift a_1 i) = x_1 ∨ i < 0%Z ∨ x_5 ≤ i + x_4 -> (∀(i_5 : Z), let x_10 : Z := i_5 + x_4 in x_7 < x_10 -> x_10 < x_5 -> ¬ t_1 (shift a_1 i_5) = x_1) -> ¬ t_1 (shift a_1 i_4) = x_1.
Admitted.
