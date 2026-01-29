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
Require Import klibc_string.Axiomatic1.Axiomatic1.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal6 (t_2 : addr -> addr) (a : addr) (t_1 : addr -> Z) (a_1 : addr) (i_4 : Z) (t : Z -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (i_3 : Z) : let a_2 : addr := t_2 a in let x : Z := l_length t_1 a_2 in let x_1 : Z := t_1 a_2 in let a_3 : addr := shift a_1 0%Z in let x_2 : Z := 1%Z + l_length t_1 a_1 in let a_4 : addr := shift a_2 0%Z in let x_3 : Z := 1%Z + x in ¬ a_2 = a -> 0%Z ≤ i_4 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_4 < x -> framed t_2 -> linked t -> sconst t_1 -> valid_rw t a 1%Z -> is_sint8 x_1 -> valid_rw t a_2 1%Z -> p_length_of_str_is t t_1 a_1 i -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_2 -> p_length_of_str_is t t_1 a_2 i_3 -> is_sint8 (t_1 (shift a_2 (- 1%Z))) -> p_char_in_str t_1 a_1 (t_1 (shift a_2 i_4)) -> separated a 1%Z a_3 x_2 -> separated a_2 1%Z a_3 x_2 -> separated a 1%Z a_4 x_3 -> separated a_4 x_3 a_3 x_2 -> separated a_2 1%Z a_4 x_3 -> p_char_in_str t_1 a_1 x_1.
Proof.
Admitted.
