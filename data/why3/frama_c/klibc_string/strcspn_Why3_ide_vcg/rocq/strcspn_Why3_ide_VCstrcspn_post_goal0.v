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
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> Z) (a : addr) (i : Z) (i_7 : Z) (a_1 : addr) (t : Z -> Z) (i_1 : Z) (i_3 : Z) (i_5 : Z) (i_2 : Z) (i_4 : Z) (i_6 : Z) : let x : Z := l_length t_1 a in let x_1 : Z := t_1 (shift a i) in 0%Z ≤ i -> 0%Z ≤ i_7 -> i_7 < i -> i ≤ x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> p_length_of_str_is t t_1 a i_1 -> p_length_of_str_is t t_1 a i_3 -> p_length_of_str_is t t_1 a i_5 -> p_length_of_str_is t t_1 a_1 i_2 -> p_length_of_str_is t t_1 a_1 i_4 -> p_length_of_str_is t t_1 a_1 i_6 -> is_sint8 x_1 -> p_char_in_str t_1 a_1 x_1 -> separated (shift a 0%Z) (1%Z + x) (shift a_1 0%Z) (1%Z + l_length t_1 a_1) -> (∀(i_8 : Z), 0%Z ≤ i_8 -> i_8 < i -> ¬ p_char_in_str t_1 a_1 (t_1 (shift a i_8))) -> ¬ p_char_in_str t_1 a_1 (t_1 (shift a i_7)).
Proof.
Admitted.
