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
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import should_we_balance.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import should_we_balance.A_schedule_cpumask.A_schedule_cpumask.
Require Import Why3.Cbits.Cbits.
Open Scope Z_scope.
Theorem goal19 (a_1 : addr) (t_3 : addr -> Z) (t_4 : addr -> addr) (a : addr) (i : Z) (t_2 : addr -> Z) (t_1 : addr -> Z) (i_1 : Z) (i_2 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 3%Z in let x : Z := t_3 a_2 in let a_3 : addr := shift a_1 4%Z in let a_4 : addr := t_4 a_3 in let a_5 : addr := shift a_4 0%Z in let a_6 : addr := t_4 a_5 in let a_7 : addr := shift a_1 1%Z in let x_1 : Z := t_3 a_7 in let x_2 : Z := t_3 (shift a_6 x_1) in let a_8 : addr := shift a i in let a_9 : addr := shift a_8 0%Z in let a_10 : addr := t_4 a_9 in let a_11 : addr := shift a_10 0%Z in let a_12 : addr -> Z := havoc t_2 t_3 a_11 l_size in let a_13 : addr := shift a_1 0%Z in let a_14 : addr := t_4 a_13 in let a_15 : addr := shift a_14 1%Z in let a_16 : Z := a_12 a_15 in let a_17 : addr := shift a_14 0%Z in let a_18 : addr := t_4 a_17 in let a_19 : addr := l_group_balance_mask a_18 in let a_20 : addr := shift a_6 0%Z in let a_21 : addr -> Z := havoc t_1 t_3 a_11 l_size in let a_22 : addr := shift a_6 (- 1%Z) in let a_23 : addr := t_4 (shift a_19 0%Z) in let a_24 : addr := shift a_23 (- 1%Z) in let a_25 : Z := a_12 (shift a_10 i_1) in let a_26 : Z := a_12 (shift a_6 i_1) in let a_27 : Z := a_12 (shift a_23 i_1) in let a_28 : addr := shift a_23 0%Z in let x_3 : Z := to_uint32 i_2 in ¬ i_1 = - 1%Z -> ¬ l_idle_cpu i_1 = 0%Z -> ¬ x = 2%Z -> ¬ x_2 = 0%Z -> land 7%Z a_16 = 0%Z -> 0%Z ≤ i -> i < l_size -> 0%Z ≤ i_1 -> i_1 < l_size -> 0%Z ≤ i_2 -> i_2 ≤ l_size -> to_uint32 i_1 < l_size -> 0%Z ≤ x_1 -> x_1 < l_size -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ 2147483646%Z -> framed t_4 -> linked t -> is_uint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rd t a_1 5%Z -> is_uint32 x -> is_sint32 x_1 -> valid_rd t a_3 1%Z -> valid_rd t a_7 1%Z -> valid_rd t a_2 1%Z -> valid_rd t a_13 1%Z -> valid_rd t a_8 1%Z -> valid_rd t a_4 1%Z -> valid_rd t (t_4 (shift a_1 2%Z)) 2%Z -> valid_rd t a_14 2%Z -> is_sint32 (t_3 a_15) -> valid_rd t a_9 1%Z -> valid_rd t a_5 1%Z -> valid_rd t a_15 1%Z -> valid_rd t a_17 1%Z -> valid_rd t a_18 1%Z -> valid_rd t a_19 1%Z -> is_uint8 x_2 -> valid_rd t a_11 l_size -> valid_rd t a_20 l_size -> valid_rw t a_11 l_size -> is_uint8 (a_21 a_22) -> is_uint8 (a_21 a_24) -> is_uint8 a_25 -> is_uint8 (a_12 a_22) -> is_uint8 a_26 -> is_uint8 (a_12 a_24) -> is_uint8 a_27 -> is_sint32 (a_21 a_15) -> is_sint32 a_16 -> valid_rd t a_28 l_size -> ¬ p_idle_core t_4 a_12 i_1 -> separated a_11 l_size a_28 l_size -> ((∃(i_3 : Z), ¬ a_12 (shift a_10 i_3) = 0%Z ∧ ¬ a_12 (shift a_6 i_3) = 0%Z ∧ i_3 < l_size ∧ x_3 ≤ i_3) -> x_3 ≤ i_1) -> ((∃(i_3 : Z), ¬ a_12 (shift a_10 i_3) = 0%Z ∧ ¬ a_12 (shift a_6 i_3) = 0%Z ∧ i_3 < l_size ∧ x_3 ≤ i_3) -> ¬ a_25 = 0%Z ∧ ¬ a_26 = 0%Z) -> ((∀(i_3 : Z), i_3 < l_size -> x_3 ≤ i_3 -> a_12 (shift a_10 i_3) = 0%Z ∨ a_12 (shift a_6 i_3) = 0%Z) -> l_size = i_1) -> ((∃(i_3 : Z), ¬ a_12 (shift a_10 i_3) = 0%Z ∧ ¬ a_12 (shift a_6 i_3) = 0%Z ∧ i_3 < l_size ∧ x_3 ≤ i_3) -> (∀(i_3 : Z), i_3 < i_1 -> x_3 ≤ i_3 -> a_12 (shift a_10 i_3) = 0%Z ∨ a_12 (shift a_6 i_3) = 0%Z)) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < l_size -> separated a_20 l_size (shift (t_4 (shift (shift a i_3) 0%Z)) 0%Z) l_size) -> (∀(i_3 : Z), let a_29 : addr := shift a i_3 in 0%Z ≤ i_3 -> i_3 < l_size -> valid_rd t a_29 1%Z ∧ valid_rw t (shift (t_4 (shift a_29 0%Z)) 0%Z) l_size) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < l_size -> (¬ a_21 (shift a_23 i_3) = 0%Z) = (¬ a_21 (shift a_10 i_3) = 0%Z)) -> (∀(i_3 : Z), ¬ a_12 (shift a_23 i_3) = 0%Z -> 0%Z ≤ i_3 -> i_3 < l_size -> ¬ a_12 (shift a_10 i_3) = 0%Z) -> (∀(i_3 : Z), ¬ a_12 (shift a_10 i_3) = 0%Z -> 0%Z ≤ i_3 -> i_3 < l_size -> ¬ a_12 (shift a_23 i_3) = 0%Z) -> (∀(i_3 : Z), ¬ a_12 (shift a_6 i_3) = 0%Z -> ¬ a_12 (shift a_23 i_3) = 0%Z -> 0%Z ≤ i_3 -> i_3 < i_2 -> i_3 < l_size -> l_idle_cpu i_3 = 0%Z) -> (∀(a_29 : addr), let a_30 : addr := l_sched_group_cpus a_29 in let a_31 : addr := shift (t_4 (shift a_30 0%Z)) 0%Z in valid_rd t a_30 1%Z ∧ valid_rd t a_31 l_size ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < l_size -> separated a_31 l_size (shift (t_4 (shift (shift a i_3) 0%Z)) 0%Z) l_size)) -> (∀(a_29 : addr), let a_30 : addr := l_sched_group_mask a_29 in let a_31 : addr := shift (t_4 (shift a_30 0%Z)) 0%Z in valid_rd t a_30 1%Z ∧ valid_rd t a_31 l_size ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < l_size -> separated a_31 l_size (shift (t_4 (shift (shift a i_3) 0%Z)) 0%Z) l_size)) -> (∀(a_29 : addr), let a_30 : addr := l_group_balance_mask a_29 in let a_31 : addr := shift (t_4 (shift a_30 0%Z)) 0%Z in valid_rd t a_30 1%Z ∧ valid_rd t a_31 l_size ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < l_size -> separated a_31 l_size (shift (t_4 (shift (shift a i_3) 0%Z)) 0%Z) l_size)) -> (∀(i_3 : Z), let a_29 : addr := l_cpu_smt_mask i_3 in let a_30 : addr := shift (t_4 (shift a_29 0%Z)) 0%Z in 0%Z ≤ i_3 -> i_3 < l_size -> valid_rd t a_29 1%Z ∧ valid_rd t a_30 l_size ∧ (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < l_size -> separated a_30 l_size (shift (t_4 (shift (shift a i_4) 0%Z)) 0%Z) l_size)) -> ¬ a_26 = 0%Z ∧ ¬ a_27 = 0%Z.
Admitted.
