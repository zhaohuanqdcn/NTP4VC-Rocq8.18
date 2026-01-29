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
Theorem goal1 (t_2 : addr -> addr) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t : Z -> Z) (i : Z) (i_1 : Z) : let a_2 : addr := t_2 a in let a_3 : addr := shift a_1 0%Z in let x : Z := 1%Z + l_length t_1 a_1 in let a_4 : addr := shift a_2 0%Z in let x_1 : Z := l_length t_1 a_2 in let x_2 : Z := 1%Z + x_1 in ¬ a_2 = a -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> sconst t_1 -> valid_rw t a 1%Z -> p_length_of_str_is t t_1 a_1 i -> p_length_of_str_is t t_1 a_1 i_1 -> separated a 1%Z a_3 x -> separated a_2 1%Z a_3 x -> separated a 1%Z a_4 x_2 -> separated a_4 x_2 a_3 x -> separated a_2 1%Z a_4 x_2 -> a_2 = Mk_addr 0%Z 0%Z ∨ valid_rw t a_2 1%Z -> a_2 = Mk_addr 0%Z 0%Z ∨ (∃(i_2 : Z), p_length_of_str_is t t_1 a_2 i_2) -> ¬ a_2 = Mk_addr 0%Z 0%Z ∨ ¬ valid_rw t a_2 1%Z ∨ (∀(i_2 : Z), ¬ p_length_of_str_is t t_1 a_1 i_2) ∨ (∀(i_2 : Z), ¬ p_length_of_str_is t t_1 a_2 i_2) ∨ (∀(i_2 : Z), i_2 < 0%Z ∨ x_1 ≤ i_2 ∨ ¬ p_char_in_str t_1 a_1 (t_1 (shift a_2 i_2))).
Proof.
Admitted.
