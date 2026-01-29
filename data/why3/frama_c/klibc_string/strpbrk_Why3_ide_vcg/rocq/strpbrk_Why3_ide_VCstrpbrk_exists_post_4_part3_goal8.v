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
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal8 (t_1 : addr -> Z) (a : addr) (i_7 : Z) (i_4 : Z) (a_1 : addr) (t : Z -> Z) (i : Z) (i_2 : Z) (i_5 : Z) (i_1 : Z) (i_3 : Z) (i_6 : Z) : let x : Z := l_length t_1 a in t_1 (shift a i_7) = 0%Z -> 0%Z ≤ i_4 -> 0%Z ≤ i_7 -> i_4 < x -> i_7 ≤ x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i_7 -> is_sint8 (t_1 (Mk_addr 0%Z 0%Z)) -> p_char_in_str t_1 a_1 0%Z -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a i_2 -> p_length_of_str_is t t_1 a i_5 -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_3 -> p_length_of_str_is t t_1 a_1 i_6 -> p_char_in_str t_1 a_1 (t_1 (shift a i_4)) -> separated (shift a 0%Z) (1%Z + x) (shift a_1 0%Z) (1%Z + l_length t_1 a_1) -> (∀(i_8 : Z), 0%Z ≤ i_8 -> i_8 < i_7 -> ¬ p_char_in_str t_1 a_1 (t_1 (shift a i_8))) -> addr_le a (Mk_addr 0%Z 0%Z).
Proof.
Admitted.
