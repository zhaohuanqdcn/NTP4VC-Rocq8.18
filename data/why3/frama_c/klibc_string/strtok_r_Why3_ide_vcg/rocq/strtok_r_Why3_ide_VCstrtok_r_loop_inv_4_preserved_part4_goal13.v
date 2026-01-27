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
Theorem goal13 : let a : addr := shift (Mk_addr 0%Z 0%Z) 0%Z in ∀(i_3 : Z) (i_2 : Z) (i_1 : Z) (i : Z) (t_2 : Z -> Z) (t_1 : Z -> Z) (t : Z -> Z) (t_5 : addr -> Z) (t_4 : addr -> Z) (t_3 : addr -> Z) (t_8 : addr -> addr) (t_7 : addr -> addr) (t_6 : addr -> addr) (a_6 : addr) (a_5 : addr) (a_4 : addr) (a_3 : addr) (a_2 : addr) (a_1 : addr), let a_7 : addr := t_7 a_4 in let a_8 : addr := t_8 a_4 in let x : Z := t_5 a_8 in let x_1 : Z := t_5 (shift a_8 (- 1%Z)) in let a_9 : addr := shift a_5 0%Z in let x_2 : Z := 1%Z + l_length t_3 a_5 in let x_3 : Z := 1%Z + l_length t_3 (Mk_addr 0%Z 0%Z) in let a_10 : addr := shift a_6 0%Z in let x_4 : Z := 1%Z + l_length t_4 a_6 in let a_11 : addr := shift a_7 0%Z in let x_5 : Z := l_length t_4 a_7 in let x_6 : Z := 1%Z + x_5 in let x_7 : Z := base a_7 in let a_12 : addr := shift (Mk_addr 0%Z 0%Z) (l_length t_4 (Mk_addr 0%Z 0%Z)) in ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_7 = a_4 -> ¬ a_7 = Mk_addr 0%Z 0%Z -> t_5 a_2 = 0%Z -> region 0%Z ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_5) ≤ 0%Z -> framed t_6 -> linked t -> sconst t_3 -> valid_rw t a_3 1%Z -> valid_rw t_1 a_4 1%Z -> is_sint8 x -> valid_rw t (t_6 a_3) 1%Z -> valid_rw t_1 a_7 1%Z -> p_length_of_str_is t t_3 a_5 i_1 -> p_length_of_str_is t t_3 a_5 i_2 -> p_length_of_str_is t_1 t_4 a_6 i_3 -> p_length_of_str_is t_1 t_4 a_7 i -> is_sint8 x_1 -> separated a_3 1%Z a_9 x_2 -> separated a_3 1%Z a x_3 -> separated a_4 1%Z a_10 x_4 -> separated a x_3 a_9 x_2 -> separated a_7 1%Z a_10 x_4 -> separated a_4 1%Z a_11 x_6 -> separated a_11 x_6 a_10 x_4 -> separated a_7 1%Z a_11 x_6 -> (¬ Mk_addr 0%Z 0%Z = a_1 -> x_7 = base a_1) -> (¬ Mk_addr 0%Z 0%Z = a_1 -> addr_le (Mk_addr 0%Z 0%Z) a_1 ∧ addr_le a_1 a_12) -> (¬ Mk_addr 0%Z 0%Z = a_1 -> addr_le (Mk_addr 0%Z 0%Z) a_7 ∧ addr_le a_7 a_12) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_5 -> ¬ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> a_7 = a_2) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∃(i_4 : Z), 0%Z ≤ i_4 ∧ i_4 < x_5 ∧ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> a_7 = a_2) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_5 -> ¬ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> a_8 = Mk_addr 0%Z 0%Z) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∃(i_4 : Z), 0%Z ≤ i_4 ∧ i_4 < x_5 ∧ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> base a_8 = x_7) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∃(i_4 : Z), 0%Z ≤ i_4 ∧ i_4 < x_5 ∧ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> x_1 = 0%Z) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∃(i_4 : Z), 0%Z ≤ i_4 ∧ i_4 < x_5 ∧ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> p_char_in_str t_5 a_6 x) -> (valid_rw t_2 a_7 1%Z -> (∃(i_4 : Z), p_length_of_str_is t_1 t_4 a_6 i_4) -> (∃(i_4 : Z), 0%Z ≤ i_4 ∧ i_4 < x_5 ∧ p_char_in_str t_4 a_6 (t_4 (shift a_7 i_4))) -> addr_lt a_7 a_8 ∧ addr_lt a_8 (shift a_7 (l_length t_5 a_7))) -> addr_le a_2 (shift (Mk_addr 0%Z 0%Z) (l_length t_5 (Mk_addr 0%Z 0%Z))).
Admitted.
