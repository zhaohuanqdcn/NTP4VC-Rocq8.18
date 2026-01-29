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
Open Scope Z_scope.
Theorem goal34 (a_1 : addr) (t_2 : addr -> Z) (a_4 : addr) (t_5 : addr -> addr) (a_3 : addr) (t_3 : addr -> Z) (a_2 : addr) (t_4 : addr -> addr) (t : Z -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (a : addr) (t_1 : Z -> Z) (a_5 : addr) : let a_6 : addr := shift a_1 0%Z in let x : Z := 1%Z + l_length t_2 a_1 in let a_7 : addr := shift a_4 0%Z in let x_1 : Z := 1%Z + l_length t_2 a_4 in let a_8 : addr := t_5 a_3 in let a_9 : addr := shift a_1 (l_length t_3 a_1) in ¬ Mk_addr 0%Z 0%Z = a_1 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> framed t_4 -> linked t -> sconst t_2 -> valid_rw t a_2 1%Z -> valid_rw t (t_4 a_2) 1%Z -> p_length_of_str_is t t_2 a_1 i -> p_length_of_str_is t t_2 a_4 i_1 -> p_length_of_str_is t t_2 a_4 i_2 -> separated a_2 1%Z a_6 x -> separated a_2 1%Z a_7 x_1 -> separated a_6 x a_7 x_1 -> (¬ Mk_addr 0%Z 0%Z = a -> base a_8 = base a) -> (¬ Mk_addr 0%Z 0%Z = a -> valid_rw t_1 a_3 1%Z) -> (¬ Mk_addr 0%Z 0%Z = a -> addr_le a_1 a ∧ addr_le a a_9) -> (¬ Mk_addr 0%Z 0%Z = a -> addr_le a_1 a_8 ∧ addr_le a_8 a_9) -> separated a_8 1%Z (shift a_5 0%Z) (1%Z + l_length t_3 a_5).
Proof.
Admitted.
