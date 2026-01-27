From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal31 : let a : addr := shift (Mk_addr 0%Z 0%Z) 0%Z in ∀(i_1 : Z) (i : Z) (t_1 : Z -> Z) (t : Z -> Z) (t_3 : addr -> Z) (t_2 : addr -> Z) (t_5 : addr -> addr) (t_4 : addr -> addr) (a_4 : addr) (a_3 : addr) (a_2 : addr) (a_1 : addr), let a_5 : addr := shift a_4 0%Z in let x : Z := 1%Z + l_length t_2 a_4 in let x_1 : Z := 1%Z + l_length t_2 (Mk_addr 0%Z 0%Z) in let a_6 : addr := t_5 a_3 in let a_7 : addr := shift (Mk_addr 0%Z 0%Z) (l_length t_3 (Mk_addr 0%Z 0%Z)) in region 0%Z ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> framed t_4 -> linked t -> sconst t_2 -> valid_rw t a_2 1%Z -> valid_rw t (t_4 a_2) 1%Z -> p_length_of_str_is t t_2 a_4 i -> p_length_of_str_is t t_2 a_4 i_1 -> separated a_2 1%Z a_5 x -> separated a_2 1%Z a x_1 -> separated a x_1 a_5 x -> (¬ Mk_addr 0%Z 0%Z = a_1 -> base a_6 = base a_1) -> (¬ Mk_addr 0%Z 0%Z = a_1 -> valid_rw t_1 a_3 1%Z) -> (¬ Mk_addr 0%Z 0%Z = a_1 -> addr_le (Mk_addr 0%Z 0%Z) a_1 ∧ addr_le a_1 a_7) -> (¬ Mk_addr 0%Z 0%Z = a_1 -> addr_le (Mk_addr 0%Z 0%Z) a_6 ∧ addr_le a_6 a_7) -> a_6 = Mk_addr 0%Z 0%Z ∨ valid_rw t_1 a_6 1%Z.
Admitted.
