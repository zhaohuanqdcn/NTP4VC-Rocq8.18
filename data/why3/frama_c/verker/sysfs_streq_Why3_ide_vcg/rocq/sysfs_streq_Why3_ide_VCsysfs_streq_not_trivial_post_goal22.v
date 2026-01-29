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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_SysfsStr.A_SysfsStr.
Require Import verker.A_StrnCmp.A_StrnCmp.
Require Import verker.A_Strnlen.A_Strnlen.
Open Scope Z_scope.
Theorem goal22 (t_1 : addr -> Z) (a_10 : addr) (a_11 : addr) (a : addr) (a_1 : addr) (a_3 : addr) (a_4 : addr) (a_5 : addr) (a_6 : addr) (a_7 : addr) (a_9 : addr) (i : Z) (t : Z -> Z) (a_8 : addr) (a_2 : addr) : let x : Z := l_sysfs_strlen t_1 a_10 in let x_1 : Z := l_sysfs_strlen t_1 a_11 in let x_2 : Z := t_1 a in let x_3 : Z := t_1 a_1 in let x_4 : Z := t_1 a_3 in let x_5 : Z := t_1 a_4 in let x_6 : Z := t_1 a_5 in let x_7 : Z := t_1 a_6 in let x_8 : Z := t_1 a_7 in let x_9 : Z := t_1 a_9 in let a_12 : addr := shift a_10 i in let x_10 : Z := t_1 a_12 in let a_13 : addr := shift a_11 i in let x_11 : Z := t_1 a_13 in let x_12 : Z := 1%Z + i in let x_13 : Z := l_sysfs_strlen t_1 a_7 in let x_14 : Z := l_sysfs_strlen t_1 a_1 in ¬ x = 0%Z -> ¬ x_1 = 0%Z -> i ≤ l_strlen t_1 a_10 -> i ≤ l_strlen t_1 a_11 -> region (base a_10) ≤ 0%Z -> region (base a_11) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint64 i -> is_sint8 x_2 -> is_sint8 x_3 -> is_sint8 x_4 -> is_sint8 x_5 -> is_sint8 x_6 -> is_sint8 x_7 -> is_sint8 x_8 -> is_sint8 (t_1 a_8) -> is_sint8 x_9 -> p_valid_str t t_1 a_10 -> p_valid_str t t_1 a_11 -> p_strnequal t_1 a_11 a_10 i -> is_sint8 (t_1 (shift a_2 1%Z)) -> is_sint8 (t_1 (shift a_4 1%Z)) -> is_sint8 x_10 -> is_sint8 x_11 -> p_valid_str t t_1 a_12 -> p_valid_str t t_1 a_13 -> (if decide (x_11 = 0%Z) then ∀(i_1 : Z), let x_15 : Z := t_1 (shift a_10 i_1) in let x_16 : Z := t_1 (shift a_11 i_1) in 0%Z ≤ i_1 -> i_1 < i -> is_uint64 i_1 -> ¬ x_15 = 0%Z ∧ ¬ x_16 = 0%Z ∧ x_16 = x_15 else ¬ x_7 = x_2 ∧ a_12 = a ∧ a_13 = a_6 ∧ (∀(i_1 : Z), let x_15 : Z := t_1 (shift a_10 i_1) in let x_16 : Z := t_1 (shift a_11 i_1) in 0%Z ≤ i_1 -> i_1 < i -> is_uint64 i_1 -> ¬ x_15 = 0%Z ∧ ¬ x_16 = 0%Z ∧ x_16 = x_15)) -> (if decide (x_11 = x_10) then x_6 = 0%Z ∧ x_9 = 0%Z ∧ a_12 = a_5 ∧ a_13 = a_9 ∧ x_1 = x else a_13 = a_7 ∧ (if decide (x_8 = 0%Z) then a_12 = a_1 ∧ (if decide (x_3 = 10%Z) then a_2 = a_1 ∧ (if decide (t_1 (shift a_10 x_12) = 0%Z) then x_13 = x_14 ∧ x = i ∧ p_strnequal t_1 a_7 a_1 x_14 else a_4 = a_1 ∧ a_8 = a_7) else a_4 = a_1 ∧ a_8 = a_7) else a_8 = a_7 ∧ (if decide (x_8 = 10%Z) then if decide (t_1 (shift a_11 x_12) = 0%Z) then a_12 = a_3 ∧ (if decide (x_4 = 0%Z) then x_13 = l_sysfs_strlen t_1 a_3 ∧ x_1 = i ∧ p_strnequal t_1 a_7 a_3 x_13 else a_4 = a_3 ∧ ¬ x_4 = 10%Z) else a_12 = a_4 ∧ (¬ x_5 = 0%Z -> ¬ x_5 = 10%Z) else a_12 = a_4 ∧ (¬ x_5 = 0%Z -> ¬ x_8 = x_5)))) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < i -> t_1 (shift a_11 i_1) = t_1 (shift a_10 i_1)) -> p_strnequal t_1 a_11 a_10 (to_uint64 (Z.min x x_1)).
Proof.
Admitted.
