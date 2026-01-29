From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.A_ToUpper.A_ToUpper.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic2.Axiomatic2.
Open Scope Z_scope.
Theorem goal18 (a : addr) (t_1 : addr -> Z) (a_1 : addr) (a_2 : addr) (i : Z) (i_1 : Z) (t : Z -> Z) (i_2 : Z) (i_5 : Z) (i_6 : Z) (i_3 : Z) (i_4 : Z) : let x : Z := base a in let x_1 : Z := t_1 a_1 in let x_2 : Z := offset a_1 in let x_3 : Z := offset a in let a_3 : addr := shift a_2 (x_2 - x_3) in let x_4 : Z := t_1 a_3 in let x_5 : Z := i + i_1 in let x_6 : Z := l_length t_1 a in let x_7 : Z := l_length t_1 a_2 in let x_8 : Z := to_uint8 x_1 in let x_9 : Z := to_uint8 x_4 in ¬ i_1 = 0%Z -> base a_1 = x -> 0%Z ≤ x_1 -> region x ≤ 0%Z -> region (base a_2) ≤ 0%Z -> 0%Z ≤ x_4 -> x_1 ≤ 255%Z -> x_4 ≤ 255%Z -> linked t -> sconst t_1 -> is_sint32 i -> is_sint32 i_1 -> addr_le a a_1 -> is_sint8 x_1 -> is_sint32 x_5 -> p_length_of_str_is t t_1 a i_2 -> p_length_of_str_is t t_1 a i_5 -> p_length_of_str_is t t_1 a i_6 -> p_length_of_str_is t t_1 a_2 i_3 -> p_length_of_str_is t t_1 a_2 i_4 -> p_length_of_str_is t t_1 a_2 i_6 -> addr_le a_1 (shift a x_6) -> separated (shift a_2 0%Z) (1%Z + x_7) (shift a 0%Z) (1%Z + x_6) -> addr_le a_2 a_3 -> addr_le a_3 (shift a_2 x_7) -> is_sint8 x_4 -> (p_is_upper x_8 -> x_1 = i) -> (p_is_lower x_8 -> x_1 = 32%Z + i) -> (¬ p_is_lower x_8 -> ¬ p_is_upper x_8 -> x_1 = i) -> (p_is_upper x_9 -> x_4 = x_5) -> (p_is_lower x_9 -> x_4 = 32%Z + i + i_1) -> (¬ p_is_lower x_9 -> ¬ p_is_upper x_9 -> x_4 = x_5) -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 + x_3 < x_2 -> l_toupper (to_uint8 (t_1 (shift a_2 i_7))) = l_toupper (to_uint8 (t_1 (shift a i_7)))) -> ¬ (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 ≤ i_6 -> l_toupper (to_uint8 (t_1 (shift a_2 i_7))) = l_toupper (to_uint8 (t_1 (shift a i_7)))).
Proof.
Admitted.
