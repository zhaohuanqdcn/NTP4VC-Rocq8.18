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
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import should_we_balance.Compound.Compound.
Require Import should_we_balance.A_schedule_cpumask.A_schedule_cpumask.
Open Scope Z_scope.
Theorem goal17 (t_3 : addr -> addr) (a_2 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (a : addr) (a_1 : addr) (i : Z) (i_1 : Z) (t : Z -> Z) : let a_3 : addr := t_3 (shift a_2 0%Z) in let a_4 : addr := shift a_3 0%Z in let a_5 : addr -> Z := havoc t_1 t_2 a_4 l_size in let a_6 : addr := t_3 (shift a 0%Z) in let a_7 : addr := shift a_6 0%Z in let a_8 : addr := t_3 (shift a_1 0%Z) in let a_9 : addr := shift a_8 0%Z in ¬ Mk_addr 0%Z 0%Z = a_2 -> to_uint32 i = l_size -> ¬ a_5 (shift a_3 i_1) = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_1 < l_size -> i ≤ l_size -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> framed t_3 -> linked t -> is_sint32 i -> valid_rd t a 1%Z -> valid_rd t a_1 1%Z -> valid_rd t a_2 1%Z -> valid_rd t a_7 l_size -> valid_rd t a_9 l_size -> valid_rw t a_4 l_size -> (¬ a_2 = a -> separated a_4 l_size a_7 l_size) -> (¬ a_2 = a_1 -> separated a_4 l_size a_9 l_size) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < l_size -> separated a_4 l_size (shift (t_3 (shift (l_cpu_smt_mask i_2) 0%Z)) 0%Z) l_size) -> (∀(i_2 : Z), let a_10 : addr := shift a_3 i_2 in i ≤ i_2 -> i_2 < l_size -> (¬ a_5 a_10 = 0%Z) = (¬ t_2 a_10 = 0%Z)) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < i -> (t_2 (shift a_6 i_2) = 0%Z ∧ ¬ t_2 (shift a_8 i_2) = 0%Z) = (¬ a_5 (shift a_3 i_2) = 0%Z)) -> ¬ t_2 (shift a_8 i_1) = 0%Z.
Proof.
Admitted.
