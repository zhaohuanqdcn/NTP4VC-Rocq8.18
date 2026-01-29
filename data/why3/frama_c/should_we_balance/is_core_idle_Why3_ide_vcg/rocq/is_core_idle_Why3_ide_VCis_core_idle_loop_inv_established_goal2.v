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
Require Import should_we_balance.A_schedule_cpumask.A_schedule_cpumask.
Require Import should_we_balance.Compound.Compound.
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal2 (i_1 : Z) (i : Z) (a : addr) (t_1 : addr -> addr) (t : Z -> Z) (fact0 : ¬ l_idle_cpu i_1 = 0%Z) (fact1 : 0%Z ≤ i) (fact2 : i < l_size) (fact3 : 0%Z ≤ i_1) (fact4 : i_1 < l_size) (fact5 : region (base a) ≤ 0%Z) (fact6 : framed t_1) (fact7 : linked t) (fact8 : is_uint32 i) (fact9 : is_sint32 i_1) (fact10 : ∀(i_2 : Z), let a_1 : addr := shift a i_2 in 0%Z ≤ i_2 -> i_2 < l_size -> valid_rd t a_1 1%Z ∧ valid_rw t (shift (t_1 (shift a_1 0%Z)) 0%Z) l_size) (fact11 : ∀(a_1 : addr), let a_2 : addr := l_sched_group_cpus a_1 in let a_3 : addr := shift (t_1 (shift a_2 0%Z)) 0%Z in valid_rd t a_2 1%Z ∧ valid_rd t a_3 l_size ∧ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < l_size -> separated a_3 l_size (shift (t_1 (shift (shift a i_2) 0%Z)) 0%Z) l_size)) (fact12 : ∀(a_1 : addr), let a_2 : addr := l_sched_group_mask a_1 in let a_3 : addr := shift (t_1 (shift a_2 0%Z)) 0%Z in valid_rd t a_2 1%Z ∧ valid_rd t a_3 l_size ∧ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < l_size -> separated a_3 l_size (shift (t_1 (shift (shift a i_2) 0%Z)) 0%Z) l_size)) (fact13 : ∀(a_1 : addr), let a_2 : addr := l_group_balance_mask a_1 in let a_3 : addr := shift (t_1 (shift a_2 0%Z)) 0%Z in valid_rd t a_2 1%Z ∧ valid_rd t a_3 l_size ∧ (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < l_size -> separated a_3 l_size (shift (t_1 (shift (shift a i_2) 0%Z)) 0%Z) l_size)) (fact14 : ∀(i_2 : Z), let a_1 : addr := l_cpu_smt_mask i_2 in let a_2 : addr := shift (t_1 (shift a_1 0%Z)) 0%Z in 0%Z ≤ i_2 -> i_2 < l_size -> valid_rd t a_1 1%Z ∧ valid_rd t a_2 l_size ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < l_size -> separated a_2 l_size (shift (t_1 (shift (shift a i_3) 0%Z)) 0%Z) l_size)) : 0%Z ≤ l_size.
Proof.
Admitted.
