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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal13 (a : addr) (a_2 : addr) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_2 : Z) (i : Z) (i_1 : Z) (t : Z -> Z) (i_3 : Z) : let x : Z := base a in let a_3 : addr := shift a_2 0%Z in let x_1 : Z := offset a_1 in let x_2 : Z := offset a in let x_4 : Z := x_1 - x_2 in let a_4 : addr -> Z := havoc t_1 t_2 a_3 x_4 in let a_5 : Z := a_4 a_1 in let x_5 : Z := l_length a_4 a in let x_6 : Z := 1%Z + l_length t_2 a in let a_6 : addr := shift a_2 x_4 in let a_7 : addr -> Z := fun_updt a_4 a_6 a_5 in ¬ a_2 = a -> base a_1 = x -> ¬ a_5 = 0%Z -> 0%Z ≤ i_2 -> x_2 ≤ x_1 -> region x ≤ 0%Z -> region (base a_2) ≤ 0%Z -> i_2 + x_2 ≤ x_1 -> x_1 ≤ x_2 + x_5 -> i ≤ 2000%Z -> i_1 ≤ 2000%Z -> linked t -> sconst t_2 -> is_sint8 i_3 -> addr_le a a_1 -> valid_rw t a 1%Z -> valid_rw t a_2 1%Z -> p_length_of_str_is t t_2 a i -> p_length_of_str_is t t_2 a i_1 -> is_sint32 x_4 -> is_sint32 (1%Z + x_1 - x_2) -> valid_rw t a_3 x_6 -> separated (shift a 0%Z) x_6 a_3 x_6 -> addr_le a_2 a_6 -> is_sint8 a_5 -> addr_le a_1 (shift a x_5) -> addr_le a_6 (shift a_2 x_5) -> (¬ a_1 = a -> ¬ i_3 = 0%Z) -> (¬ x_1 = x_2 -> ¬ i_3 = 0%Z) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + x_2 < x_1 -> a_4 (shift a_2 i_4) = a_4 (shift a i_4)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + x_2 < x_1 -> ¬ a_4 (shift a i_4) = 0%Z) -> a_7 (shift a_2 i_2) = a_7 (shift a i_2).
Proof.
Admitted.
