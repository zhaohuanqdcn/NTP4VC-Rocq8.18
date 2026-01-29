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
Theorem goal24 (t_1 : addr -> Z) (a : addr) (a_6 : addr) (t_2 : addr -> Z) (a_7 : addr) (t_3 : addr -> Z) (a_1 : addr) (t_7 : addr -> Z) (a_3 : addr) (t_8 : addr -> Z) (a_4 : addr) (t_11 : addr -> Z) (a_5 : addr) (a_9 : addr) (a_10 : addr) (i_1 : Z) (a_13 : addr) (a_11 : addr) (t_10 : addr -> Z) (t_5 : addr -> Z) (a_14 : addr) (t_6 : addr -> Z) (t_9 : addr -> Z) (t : Z -> Z) (i : Z) (a_8 : addr) (t_4 : addr -> Z) (a_2 : addr) (a_12 : addr) (a_15 : addr) : let x : Z := t_1 a in let x_1 : Z := t_1 a_6 in let x_2 : Z := t_2 a_7 in let x_3 : Z := t_3 a_1 in let x_4 : Z := t_7 a_3 in let x_5 : Z := t_8 a_4 in let x_6 : Z := t_11 a_5 in let x_7 : Z := t_11 a_9 in let a_16 : addr := shift a_10 i_1 in let x_8 : Z := t_1 a_16 in let a_17 : addr := shift a_13 i_1 in let x_9 : Z := t_1 a_17 in let a_18 : addr := shift a_11 i_1 in let x_10 : Z := 1%Z + i_1 in let a_19 : addr := shift a_11 x_10 in let x_11 : Z := l_sysfs_strlen t_10 a_1 in let x_12 : Z := t_5 a_7 in let a_20 : addr := shift a_14 x_10 in let x_13 : Z := t_6 a_20 in let x_14 : Z := t_7 a_1 in let x_15 : Z := t_9 a_7 in let x_16 : Z := l_sysfs_strlen t_9 a_7 in let x_17 : Z := l_sysfs_strlen t_9 a_1 in let x_18 : Z := l_sysfs_strlen t_9 a_14 in let x_19 : Z := t_9 a_20 in let x_20 : Z := t_8 a_1 in let x_21 : Z := t_8 a_7 in let x_22 : Z := t_8 a_19 in let x_23 : Z := t_8 a_20 in let x_24 : Z := t_8 a_3 in (¬ l_sysfs_strlen t_1 a_13 = 0%Z) = (l_sysfs_strlen t_1 a_10 = 0%Z) -> i_1 ≤ l_strlen t_1 a_10 -> i_1 ≤ l_strlen t_1 a_13 -> region (base a_10) ≤ 0%Z -> region (base a_13) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint8 i -> is_uint64 i_1 -> is_sint8 x -> is_sint8 x_1 -> is_sint8 x_2 -> is_sint8 x_3 -> is_sint8 (t_5 a_8) -> is_sint8 x_4 -> is_sint8 x_5 -> is_sint8 x_6 -> is_sint8 x_7 -> p_valid_str t t_1 a_10 -> p_valid_str t t_1 a_13 -> p_strnequal t_1 a_13 a_10 i_1 -> is_sint8 x_8 -> is_sint8 x_9 -> is_sint8 (t_4 (shift a_2 1%Z)) -> is_sint8 (t_8 (shift a_4 1%Z)) -> p_valid_str t t_1 a_16 -> p_valid_str t t_1 a_17 -> (if decide (x_9 = 0%Z) then ∀(i_2 : Z), let x_25 : Z := t_1 (shift a_10 i_2) in let x_26 : Z := t_1 (shift a_13 i_2) in 0%Z ≤ i_2 -> i_2 < i_1 -> is_uint64 i_2 -> ¬ x_25 = 0%Z ∧ ¬ x_26 = 0%Z ∧ x_26 = x_25 else ¬ x_1 = x ∧ a_16 = a ∧ a_17 = a_6 ∧ (∀(i_2 : Z), let x_25 : Z := t_1 (shift a_10 i_2) in let x_26 : Z := t_1 (shift a_13 i_2) in 0%Z ≤ i_2 -> i_2 < i_1 -> is_uint64 i_2 -> ¬ x_25 = 0%Z ∧ ¬ x_26 = 0%Z ∧ x_26 = x_25)) -> (if decide (x_9 = x_8) then i = 1%Z ∧ a_12 = a_10 ∧ a_15 = a_13 ∧ t_11 = t_1 ∧ x_6 = 0%Z ∧ x_7 = 0%Z ∧ shift a_12 i_1 = a_5 ∧ shift a_15 i_1 = a_9 ∧ l_sysfs_strlen t_11 a_15 = l_sysfs_strlen t_11 a_12 else a_11 = a_10 ∧ a_14 = a_13 ∧ t_2 = t_1 ∧ shift a_14 i_1 = a_7 ∧ (if decide (x_2 = 0%Z) then t_3 = t_2 ∧ a_18 = a_1 ∧ (if decide (x_3 = 10%Z) then a_2 = a_1 ∧ t_4 = t_3 ∧ (if decide (t_4 a_19 = 0%Z) then i = 1%Z ∧ t_10 = t_4 ∧ t_10 a_1 = 10%Z ∧ l_sysfs_strlen t_10 a_7 = x_11 ∧ l_sysfs_strlen t_10 a_11 = i_1 ∧ t_10 a_19 = 0%Z ∧ p_strnequal t_10 a_7 a_1 x_11 else a_8 = a_7 ∧ t_5 = t_4 ∧ (if decide (x_12 = 10%Z) then t_6 = t_5 ∧ (if decide (x_13 = 0%Z) then a_3 = a_1 ∧ t_7 = t_6 ∧ (if decide (x_14 = 0%Z) then i = 1%Z ∧ t_9 = t_7 ∧ x_15 = 10%Z ∧ x_16 = x_17 ∧ x_18 = i_1 ∧ x_19 = 0%Z ∧ p_strnequal t_9 a_7 a_1 x_16 else i = 0%Z ∧ a_4 = a_1 ∧ t_8 = t_7 ∧ (¬ x_20 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_20) ∧ (x_21 = 0%Z -> ¬ x_20 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_20 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)) else i = 0%Z ∧ a_4 = a_1 ∧ t_8 = t_6 ∧ (¬ x_20 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_20) ∧ (x_21 = 0%Z -> ¬ x_20 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_20 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)) else i = 0%Z ∧ a_4 = a_1 ∧ t_8 = t_5 ∧ (¬ x_20 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_20) ∧ (x_21 = 0%Z -> ¬ x_20 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_20 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z))) else a_8 = a_7 ∧ t_5 = t_3 ∧ (if decide (x_12 = 10%Z) then t_6 = t_5 ∧ (if decide (x_13 = 0%Z) then a_3 = a_1 ∧ t_7 = t_6 ∧ (if decide (x_14 = 0%Z) then i = 1%Z ∧ t_9 = t_7 ∧ x_15 = 10%Z ∧ x_16 = x_17 ∧ x_18 = i_1 ∧ x_19 = 0%Z ∧ p_strnequal t_9 a_7 a_1 x_16 else i = 0%Z ∧ a_4 = a_1 ∧ t_8 = t_7 ∧ (¬ x_20 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_20) ∧ (x_21 = 0%Z -> ¬ x_20 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_20 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)) else i = 0%Z ∧ a_4 = a_1 ∧ t_8 = t_6 ∧ (¬ x_20 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_20) ∧ (x_21 = 0%Z -> ¬ x_20 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_20 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)) else i = 0%Z ∧ a_4 = a_1 ∧ t_8 = t_5 ∧ (¬ x_20 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_20) ∧ (x_21 = 0%Z -> ¬ x_20 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_20 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z))) else a_8 = a_7 ∧ t_5 = t_2 ∧ (if decide (x_12 = 10%Z) then t_6 = t_5 ∧ (if decide (x_13 = 0%Z) then t_7 = t_6 ∧ a_18 = a_3 ∧ (if decide (x_4 = 0%Z) then i = 1%Z ∧ t_9 = t_7 ∧ x_15 = 10%Z ∧ x_16 = l_sysfs_strlen t_9 a_3 ∧ x_18 = i_1 ∧ x_19 = 0%Z ∧ p_strnequal t_9 a_7 a_3 x_16 else i = 0%Z ∧ a_4 = a_3 ∧ t_8 = t_7 ∧ (¬ x_24 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_24) ∧ (x_21 = 0%Z -> ¬ x_24 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_24 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)) else i = 0%Z ∧ t_8 = t_6 ∧ a_18 = a_4 ∧ (¬ x_5 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_5) ∧ (x_21 = 0%Z -> ¬ x_5 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_5 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)) else i = 0%Z ∧ t_8 = t_5 ∧ a_18 = a_4 ∧ (¬ x_5 = 0%Z -> ¬ x_21 = 0%Z -> ¬ x_21 = x_5) ∧ (x_21 = 0%Z -> ¬ x_5 = 10%Z ∨ ¬ x_22 = 0%Z) ∧ (x_5 = 0%Z -> ¬ x_21 = 10%Z ∨ ¬ x_23 = 0%Z)))) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < i_1 -> t_1 (shift a_13 i_2) = t_1 (shift a_10 i_2)) -> i = 0%Z.
Proof.
Admitted.
