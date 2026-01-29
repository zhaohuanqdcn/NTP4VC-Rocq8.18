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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal28 (a_2 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (a : addr) (i_4 : Z) (a_1 : addr) (i_1 : Z) (i_2 : Z) (i_3 : Z) (t : Z -> Z) : let a_3 : addr := shift a_2 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i in let a_5 : addr := shift a i_4 in let x : Z := offset a_2 in let x_1 : Z := offset a_1 in let x_2 : Z := l_length t_2 a in let x_3 : Z := l_length a_4 a in let x_4 : Z := 2%Z + i_4 in let a_6 : addr -> Z := fun_updt a_4 a_1 0%Z in a_4 a_5 = 0%Z -> 0%Z < i -> i ≤ i_1 -> i ≤ i_2 -> 0%Z ≤ i_3 -> i_3 < i -> 0%Z ≤ i_4 -> x ≤ x_1 -> i < x_2 -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> x_1 ≤ i + x -> i_4 ≤ x_3 -> linked t -> sconst t_2 -> is_uint32 i_4 -> is_sint32 i -> addr_le a_2 a_1 -> p_length_of_str_is t t_2 a i_1 -> p_length_of_str_is t t_2 a i_2 -> addr_le a a_5 -> addr_le a_1 (shift a_2 i) -> valid_rw t a_3 i -> separated (shift a 0%Z) (1%Z + x_2) a_3 i -> addr_le a_5 (shift a x_3) -> (x_4 ≤ i -> shift a_2 i_4 = a_1) -> (x_4 ≤ i -> (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i_4 -> a_4 (shift a_2 i_5) = a_4 (shift a i_5))) -> a_6 (shift a_2 i_3) = a_6 (shift a i_3).
Proof.
Admitted.
