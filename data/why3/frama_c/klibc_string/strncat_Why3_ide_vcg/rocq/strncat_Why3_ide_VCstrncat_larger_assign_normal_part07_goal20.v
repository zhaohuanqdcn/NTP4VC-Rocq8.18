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
Theorem goal20 (a_2 : addr) (t_3 : addr -> Z) (i_1 : Z) (i : Z) (t_2 : addr -> Z) (a_1 : addr) (a : addr) (t_1 : addr -> Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (t : Z -> Z) (i_5 : Z) : let a_3 : addr := shift a_2 (l_length t_3 a_2) in let x : Z := i_1 - i in let x_1 : Z := l_length t_2 a_1 in let x_2 : Z := base a_2 in let x_3 : Z := t_2 a in let a_4 : addr := shift a_2 0%Z in let x_4 : Z := i_1 + x_1 in let x_5 : Z := l_length t_2 a_2 in havoc t_1 t_2 a_3 x = t_3 -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> 0%Z ≤ i_3 -> i_3 < i_1 -> 0%Z ≤ i_4 -> i_4 < i_1 -> x_1 ≤ i_1 -> region (base a_1) ≤ 0%Z -> region x_2 ≤ 0%Z -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> is_sint8 x_3 -> p_length_of_str_is t t_2 a_1 i_4 -> p_length_of_str_is t t_2 a_2 i_2 -> p_length_of_str_is t t_2 a_2 i_3 -> p_length_of_str_is t t_2 a_2 i_5 -> valid_rw t a_4 x_4 -> ¬ invalid t a_3 x -> separated (shift a_1 0%Z) x_4 a_4 i_1 -> ((∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 < x_5 -> ¬ t_2 (shift a_2 i_6) = 0%Z) -> Mk_addr 0%Z 0%Z = a) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_5) -> x_3 = 0%Z) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_5) -> x_2 = base a) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_5) -> p_exists_first_occurence_of_char t t_2 a_2 0%Z (offset a - offset a_2)) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_5) -> addr_le a_2 a ∧ addr_le a (shift a_2 x_5)) -> included a_3 x (shift a_2 i_1) (x_1 + x_5 - i_1).
Admitted.
