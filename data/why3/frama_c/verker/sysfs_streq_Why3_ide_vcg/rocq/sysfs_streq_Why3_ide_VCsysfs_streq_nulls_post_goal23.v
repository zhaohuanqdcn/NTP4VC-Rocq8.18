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
Theorem goal23 (a_10 : addr) (i : Z) (t_1 : addr -> Z) (a_9 : addr) (a : addr) (a_6 : addr) (t_2 : addr -> Z) (a_1 : addr) (t_6 : addr -> Z) (a_3 : addr) (t_7 : addr -> Z) (a_4 : addr) (t_4 : addr -> Z) (t_5 : addr -> Z) (t : Z -> Z) (a_7 : addr) (t_8 : addr -> Z) (a_5 : addr) (a_8 : addr) (t_3 : addr -> Z) (a_2 : addr) : let a_11 : addr := shift a_10 i in let x : Z := t_1 a_11 in let a_12 : addr := shift a_9 i in let x_1 : Z := t_1 a_12 in let x_2 : Z := t_1 a in let x_3 : Z := t_1 a_6 in let x_4 : Z := t_2 a_1 in let x_5 : Z := t_6 a_3 in let x_6 : Z := t_7 a_4 in let x_7 : Z := 1%Z + i in let a_13 : addr := shift a_9 x_7 in let x_8 : Z := t_4 a_11 in let a_14 : addr := shift a_10 x_7 in let x_9 : Z := t_5 a_14 in let x_10 : Z := t_6 a_1 in let x_11 : Z := t_7 a_1 in let x_12 : Z := t_7 a_11 in let x_13 : Z := t_7 a_13 in let x_14 : Z := t_7 a_14 in let x_15 : Z := t_7 a_3 in l_sysfs_strlen t_1 a_9 = 0%Z -> l_sysfs_strlen t_1 a_10 = 0%Z -> ¬ x = x_1 -> i ≤ l_strlen t_1 a_9 -> i ≤ l_strlen t_1 a_10 -> region (base a_9) ≤ 0%Z -> region (base a_10) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint64 i -> is_sint8 x_2 -> is_sint8 x_3 -> is_sint8 x_4 -> is_sint8 (t_4 a_7) -> is_sint8 x_5 -> is_sint8 x_6 -> is_sint8 (t_8 a_5) -> is_sint8 (t_8 a_8) -> p_valid_str t t_1 a_9 -> p_valid_str t t_1 a_10 -> p_strnequal t_1 a_10 a_9 i -> is_sint8 x_1 -> is_sint8 x -> is_sint8 (t_3 (shift a_2 1%Z)) -> is_sint8 (t_7 (shift a_4 1%Z)) -> p_valid_str t t_1 a_12 -> p_valid_str t t_1 a_11 -> (if decide (x = 0%Z) then ∀(i_1 : Z), let x_16 : Z := t_1 (shift a_9 i_1) in let x_17 : Z := t_1 (shift a_10 i_1) in 0%Z ≤ i_1 -> i_1 < i -> is_uint64 i_1 -> ¬ x_16 = 0%Z ∧ ¬ x_17 = 0%Z ∧ x_17 = x_16 else ¬ x_3 = x_2 ∧ a_12 = a ∧ a_11 = a_6 ∧ (∀(i_1 : Z), let x_16 : Z := t_1 (shift a_9 i_1) in let x_17 : Z := t_1 (shift a_10 i_1) in 0%Z ≤ i_1 -> i_1 < i -> is_uint64 i_1 -> ¬ x_16 = 0%Z ∧ ¬ x_17 = 0%Z ∧ x_17 = x_16)) -> (if decide (x = 0%Z) then t_2 = t_1 ∧ a_12 = a_1 ∧ (if decide (x_4 = 10%Z) then a_2 = a_1 ∧ t_3 = t_2 ∧ t_4 = t_3 ∧ a_11 = a_7 ∧ ¬ t_3 a_13 = 0%Z ∧ (if decide (x_8 = 10%Z) then t_5 = t_4 ∧ (if decide (x_9 = 0%Z) then a_3 = a_1 ∧ a_4 = a_1 ∧ t_6 = t_5 ∧ t_7 = t_6 ∧ ¬ x_10 = 0%Z ∧ (¬ x_11 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_11) ∧ (x_12 = 0%Z -> ¬ x_11 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_11 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z) else a_4 = a_1 ∧ t_7 = t_5 ∧ (¬ x_11 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_11) ∧ (x_12 = 0%Z -> ¬ x_11 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_11 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z)) else a_4 = a_1 ∧ t_7 = t_4 ∧ (¬ x_11 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_11) ∧ (x_12 = 0%Z -> ¬ x_11 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_11 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z)) else t_4 = t_2 ∧ a_11 = a_7 ∧ (if decide (x_8 = 10%Z) then t_5 = t_4 ∧ (if decide (x_9 = 0%Z) then a_3 = a_1 ∧ a_4 = a_1 ∧ t_6 = t_5 ∧ t_7 = t_6 ∧ ¬ x_10 = 0%Z ∧ (¬ x_11 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_11) ∧ (x_12 = 0%Z -> ¬ x_11 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_11 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z) else a_4 = a_1 ∧ t_7 = t_5 ∧ (¬ x_11 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_11) ∧ (x_12 = 0%Z -> ¬ x_11 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_11 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z)) else a_4 = a_1 ∧ t_7 = t_4 ∧ (¬ x_11 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_11) ∧ (x_12 = 0%Z -> ¬ x_11 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_11 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z))) else t_4 = t_1 ∧ a_11 = a_7 ∧ (if decide (x_8 = 10%Z) then t_5 = t_4 ∧ (if decide (x_9 = 0%Z) then a_4 = a_3 ∧ t_6 = t_5 ∧ t_7 = t_6 ∧ ¬ x_5 = 0%Z ∧ a_12 = a_3 ∧ (¬ x_15 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_15) ∧ (x_12 = 0%Z -> ¬ x_15 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_15 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z) else t_7 = t_5 ∧ a_12 = a_4 ∧ (¬ x_6 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_6) ∧ (x_12 = 0%Z -> ¬ x_6 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_6 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z)) else t_7 = t_4 ∧ a_12 = a_4 ∧ (¬ x_6 = 0%Z -> ¬ x_12 = 0%Z -> ¬ x_12 = x_6) ∧ (x_12 = 0%Z -> ¬ x_6 = 10%Z ∨ ¬ x_13 = 0%Z) ∧ (x_6 = 0%Z -> ¬ x_12 = 10%Z ∨ ¬ x_14 = 0%Z))) -> ¬ (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < i -> t_1 (shift a_10 i_1) = t_1 (shift a_9 i_1)).
Proof.
Admitted.
