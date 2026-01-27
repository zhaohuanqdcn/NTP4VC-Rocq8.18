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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal7 (t_2 : addr -> addr) (a : addr) (t_1 : addr -> Z) (a_1 : addr) (a_2 : addr) (i : Z) (i_6 : Z) (t : Z -> Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_8 : Z) (i_1 : Z) (i_5 : Z) (i_7 : Z) : let a_3 : addr := t_2 a in let x : Z := l_length t_1 a_3 in let x_1 : Z := t_1 a_1 in let x_2 : Z := t_1 (shift a_1 1%Z) in let a_4 : addr := shift a_2 0%Z in let x_3 : Z := 1%Z + l_length t_1 a_2 in let a_5 : addr := shift a_3 0%Z in let x_4 : Z := 1%Z + x in ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ a_3 = a -> ¬ a_3 = Mk_addr 0%Z 0%Z -> base a_3 = base a_1 -> 0%Z ≤ i -> 0%Z ≤ i_6 -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> i < x -> i_6 < x -> framed t_2 -> linked t -> sconst t_1 -> is_sint8 x_1 -> valid_rw t a 1%Z -> addr_le a_3 a_1 -> valid_rw t a_3 1%Z -> p_length_of_str_is t t_1 a_2 i_2 -> p_length_of_str_is t t_1 a_2 i_3 -> p_length_of_str_is t t_1 a_2 i_4 -> p_length_of_str_is t t_1 a_2 i_8 -> p_char_in_str t_1 a_2 x_1 -> is_sint8 x_2 -> p_length_of_str_is t t_1 a_3 i_1 -> p_length_of_str_is t t_1 a_3 i_5 -> p_length_of_str_is t t_1 a_3 i_7 -> p_char_in_str t_1 a_2 (t_1 (shift a_3 i)) -> p_char_in_str t_1 a_2 (t_1 (shift a_3 i_6)) -> addr_lt a_1 (shift a_3 x) -> separated a 1%Z a_4 x_3 -> separated a_3 1%Z a_4 x_3 -> separated a 1%Z a_5 x_4 -> separated a_5 x_4 a_4 x_3 -> separated a_3 1%Z a_5 x_4 -> (∀(i_9 : Z), 0%Z ≤ i_9 -> i_9 + offset a_3 < offset a_1 -> ¬ p_char_in_str t_1 a_2 (t_1 (shift a_3 i_9))) -> p_char_in_str (fun_updt t_1 a_1 0%Z) a_2 x_2.
Admitted.
