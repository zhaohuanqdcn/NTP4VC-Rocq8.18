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
Require Import klibc_string.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal7 (a_2 : addr) (t_1 : addr -> Z) (a_1 : addr) (i : Z) (i_1 : Z) (i_2 : Z) (a : addr) (t : Z -> Z) (i_3 : Z) : let x : Z := base a_2 in let x_1 : Z := t_1 a_1 in let x_2 : Z := l_length t_1 a_2 in 0%Z ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> 0%Z ≤ i_2 -> i_2 < i -> region (base a) ≤ 0%Z -> region x ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> is_sint8 x_1 -> p_length_of_str_is t t_1 a_2 i_1 -> p_length_of_str_is t t_1 a_2 i_2 -> p_length_of_str_is t t_1 a_2 i_3 -> ((∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_2 -> ¬ t_1 (shift a_2 i_4) = 0%Z) -> Mk_addr 0%Z 0%Z = a_1) -> ((∃(i_4 : Z), t_1 (shift a_2 i_4) = 0%Z ∧ 0%Z ≤ i_4 ∧ i_4 < x_2) -> x_1 = 0%Z) -> ((∃(i_4 : Z), t_1 (shift a_2 i_4) = 0%Z ∧ 0%Z ≤ i_4 ∧ i_4 < x_2) -> x = base a_1) -> ((∃(i_4 : Z), t_1 (shift a_2 i_4) = 0%Z ∧ 0%Z ≤ i_4 ∧ i_4 < x_2) -> p_exists_first_occurence_of_char t t_1 a_2 0%Z (offset a_1 - offset a_2)) -> ((∃(i_4 : Z), t_1 (shift a_2 i_4) = 0%Z ∧ 0%Z ≤ i_4 ∧ i_4 < x_2) -> addr_le a_2 a_1 ∧ addr_le a_1 (shift a_2 x_2)) -> addr_le (shift a_2 i) a_1.
Admitted.
