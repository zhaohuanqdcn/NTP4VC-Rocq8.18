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
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal9 (a_1 : addr) (i_7 : Z) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (a : addr) (i_6 : Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_5 : Z) (i : Z) (i_8 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_7 in let a_3 : addr := shift a_1 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i_1 in let a_5 : addr := shift a i_6 in let a_6 : Z := a_4 a_5 in let x : Z := l_length a_4 a in let x_1 : Z := 1%Z + i_2 + i_3 in let x_2 : Z := 1%Z + i_4 + i_5 in let a_7 : addr := shift a 0%Z in t_2 a_2 = 0%Z -> ¬ a_6 = 0%Z -> 0%Z < i -> i_1 ≤ i -> i_7 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_6 -> i_1 ≤ i_6 -> i_7 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i ≤ to_uint32 (1%Z + i_8) -> i_6 ≤ x -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_7 -> is_uint32 i_8 -> is_sint32 i_1 -> is_sint32 i_6 -> p_length_of_str_is t t_2 a i_3 -> p_length_of_str_is t t_2 a i_5 -> p_length_of_str_is t t_2 a_1 i_2 -> p_length_of_str_is t t_2 a_1 i_4 -> addr_le a a_5 -> addr_le a_1 a_2 -> valid_rw t a_3 x_1 -> valid_rw t a_3 x_2 -> separated a_7 (1%Z + i_3) a_3 x_1 -> separated a_7 (1%Z + i_5) a_3 x_2 -> addr_le a_2 (shift a_1 (l_length t_2 a_1)) -> is_sint8 a_6 -> addr_le a_5 (shift a x) -> (∀(i_9 : Z), 0%Z ≤ i_9 -> i_9 < i_7 -> ¬ t_2 (shift a_1 i_9) = 0%Z) -> (∀(i_9 : Z), 0%Z ≤ i_9 -> i_9 < i_6 -> ¬ a_4 (shift a i_9) = 0%Z) -> addr_le a (shift a (1%Z + i_6)).
Admitted.
