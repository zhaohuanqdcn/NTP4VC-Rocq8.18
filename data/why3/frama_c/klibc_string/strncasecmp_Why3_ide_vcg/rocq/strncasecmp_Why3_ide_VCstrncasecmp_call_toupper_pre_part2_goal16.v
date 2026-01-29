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
Require Import klibc_string.Axiomatic2.Axiomatic2.
Require Import klibc_string.A_ToUpper.A_ToUpper.
Open Scope Z_scope.
Theorem goal16 (a_6 : addr) (a_7 : addr) (i_1 : Z) (i : Z) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t : Z -> Z) (t_2 : addr -> Z) (i_2 : Z) (i_5 : Z) (i_3 : Z) (i_4 : Z) (a_2 : addr) (a_4 : addr) (a_3 : addr) (a_5 : addr) : let a_8 : addr := shift a_6 0%Z in let a_9 : addr := shift a_7 0%Z in let x : Z := i_1 - i in let a_10 : addr := shift a x in let a_11 : addr := shift a_1 x in let x_1 : Z := t_1 a_11 in ¬ i = 0%Z -> 0%Z < i_1 -> 0%Z ≤ i -> i ≤ i_1 -> region (base a_6) ≤ 0%Z -> region (base a_7) ≤ 0%Z -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> p_length_of_str_is t t_2 a_6 i_2 -> p_length_of_str_is t t_2 a_6 i_5 -> p_length_of_str_is t t_2 a_7 i_3 -> p_length_of_str_is t t_2 a_7 i_4 -> valid_rw t a_8 i_1 -> valid_rw t a_9 i_1 -> separated a_9 i_1 a_8 i_1 -> addr_le a_2 a_10 -> addr_le a_4 a_11 -> addr_le a_10 (shift a_3 i_1) -> addr_le a_11 (shift a_5 i_1) -> is_uint8 x_1 -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 + i < i_1 -> l_toupper (to_uint8 (t_2 (shift a_7 i_6))) = l_toupper (to_uint8 (t_2 (shift a_6 i_6)))) -> x_1 ≤ 255%Z.
Proof.
Admitted.
