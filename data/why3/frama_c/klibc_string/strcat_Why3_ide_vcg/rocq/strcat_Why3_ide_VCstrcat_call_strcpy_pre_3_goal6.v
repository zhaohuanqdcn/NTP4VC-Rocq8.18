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
Theorem goal6 (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t : Z -> Z) (i : Z) (i_3 : Z) (i_1 : Z) (i_2 : Z) (i_4 : Z) : let x : Z := base a in let x_1 : Z := base a_1 in let x_2 : Z := t_1 a in let a_2 : addr := shift a_1 0%Z in let x_3 : Z := l_length t_1 a in let x_4 : Z := l_length t_1 a_1 in region x ≤ 0%Z -> region x_1 ≤ 0%Z -> linked t -> sconst t_1 -> is_sint8 x_2 -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a i_3 -> p_length_of_str_is t t_1 a_1 i_1 -> p_length_of_str_is t t_1 a_1 i_2 -> p_length_of_str_is t t_1 a_1 i_4 -> valid_rw t a_2 (x_3 + x_4) -> separated a_2 (1%Z + x_4) (shift a 0%Z) (1%Z + x_3) -> ((∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < x_4 -> ¬ t_1 (shift a_1 i_5) = 0%Z) -> Mk_addr 0%Z 0%Z = a) -> ((∃(i_5 : Z), t_1 (shift a_1 i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < x_4) -> x_2 = 0%Z) -> ((∃(i_5 : Z), t_1 (shift a_1 i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < x_4) -> x_1 = x) -> ((∃(i_5 : Z), t_1 (shift a_1 i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < x_4) -> p_exists_first_occurence_of_char t t_1 a_1 0%Z (offset a - offset a_1)) -> ¬ ((∃(i_5 : Z), t_1 (shift a_1 i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < x_4) -> addr_le a_1 a ∧ addr_le a (shift a_1 x_4)).
Proof.
Admitted.
