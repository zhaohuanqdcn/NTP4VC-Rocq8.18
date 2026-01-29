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
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal26 (t_3 : addr -> Z) (a_2 : addr) (i_1 : Z) (i : Z) (t_2 : addr -> Z) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (i_2 : Z) (i_3 : Z) (i_4 : Z) (t : Z -> Z) (i_5 : Z) : let x : Z := l_length t_3 a_2 in let x_2 : Z := i_1 - i in let x_3 : Z := base a_2 in let x_4 : Z := t_2 a in let a_3 : addr := shift a_2 0%Z in let x_5 : Z := 2%Z * i_1 in let a_4 : addr := shift a_1 x_2 in let a_5 : addr := shift a_2 (i_1 + x - i) in let x_6 : Z := i_1 + x in let x_7 : Z := l_length t_2 a_2 in let a_6 : addr := shift a_2 x_7 in ¬ i = 0%Z -> havoc t_1 t_2 (shift a_2 x) x_2 = t_3 -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> 0%Z ≤ i_3 -> i_3 < i_1 -> 0%Z ≤ i_4 -> i_4 < i_1 -> i_1 < l_length t_2 a_1 -> region (base a_1) ≤ 0%Z -> region x_3 ≤ 0%Z -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> is_sint8 x_4 -> p_length_of_str_is t t_2 a_1 i_4 -> p_length_of_str_is t t_2 a_2 i_2 -> p_length_of_str_is t t_2 a_2 i_3 -> p_length_of_str_is t t_2 a_2 i_5 -> valid_rw t a_3 x_5 -> separated (shift a_1 0%Z) x_5 a_3 i_1 -> addr_le a_1 a_4 -> addr_le a_4 (shift a_1 i_1) -> addr_le (shift a_2 i_1) a_5 -> addr_le a_5 (shift a_2 x_6) -> ¬ invalid t a_5 1%Z -> ((∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 < x_7 -> ¬ t_2 (shift a_2 i_6) = 0%Z) -> Mk_addr 0%Z 0%Z = a) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_7) -> x_4 = 0%Z) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_7) -> x_3 = base a) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_7) -> p_exists_first_occurence_of_char t t_2 a_2 0%Z (offset a - offset a_2)) -> ((∃(i_6 : Z), t_2 (shift a_2 i_6) = 0%Z ∧ 0%Z ≤ i_6 ∧ i_6 < x_7) -> addr_le a_2 a ∧ addr_le a a_6) -> (∀(i_6 : Z), x ≤ i_6 -> i_6 + i < x_6 -> t_3 (shift a_2 (i_6 + x)) = t_3 (shift a_1 i_6)) -> included a_5 1%Z a_6 i_1.
Proof.
Admitted.
