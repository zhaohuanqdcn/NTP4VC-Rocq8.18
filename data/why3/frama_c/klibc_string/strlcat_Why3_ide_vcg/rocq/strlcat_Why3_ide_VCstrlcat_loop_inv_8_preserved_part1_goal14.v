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
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal14 (a_2 : addr) (i_8 : Z) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (a : addr) (i_6 : Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_5 : Z) (i : Z) (i_7 : Z) (i_9 : Z) (t : Z -> Z) (a_1 : addr) : let a_3 : addr := shift a_2 i_8 in let a_4 : addr := shift a_2 0%Z in let a_5 : addr -> Z := havoc t_1 t_2 a_4 i_1 in let a_6 : addr := shift a i_6 in let a_7 : Z := a_5 a_6 in let x : Z := l_length a_5 a in let x_1 : Z := 1%Z + i_2 + i_3 in let x_2 : Z := 1%Z + i_4 + i_5 in let a_8 : addr := shift a 0%Z in t_2 a_3 = 0%Z -> ¬ a_7 = 0%Z -> 0%Z < i -> i_1 ≤ i -> i_8 ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_6 -> i_1 ≤ i_6 -> i_7 ≤ i_6 -> 0%Z ≤ i_7 -> i_8 < i -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> to_uint32 (1%Z + i_9) < i -> i_6 ≤ x -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_8 -> is_uint32 i_9 -> is_sint32 i_1 -> is_sint32 i_6 -> is_sint32 (1%Z + i_6) -> p_length_of_str_is t t_2 a i_3 -> p_length_of_str_is t t_2 a i_5 -> p_length_of_str_is t t_2 a_2 i_2 -> p_length_of_str_is t t_2 a_2 i_4 -> addr_le a a_6 -> addr_le a_2 a_3 -> valid_rw t a_4 x_1 -> valid_rw t a_4 x_2 -> separated a_8 (1%Z + i_3) a_4 x_1 -> separated a_8 (1%Z + i_5) a_4 x_2 -> addr_le a_3 (shift a_2 (l_length t_2 a_2)) -> is_sint8 a_7 -> addr_le a_6 (shift a x) -> (∀(i_10 : Z), 0%Z ≤ i_10 -> i_10 < i_8 -> ¬ t_2 (shift a_2 i_10) = 0%Z) -> (∀(i_10 : Z), 0%Z ≤ i_10 -> i_10 < i_6 -> ¬ a_5 (shift a i_10) = 0%Z) -> ¬ fun_updt a_5 a_1 a_7 (shift a i_7) = 0%Z.
Proof.
Admitted.
