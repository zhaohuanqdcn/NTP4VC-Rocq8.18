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
Require Import Why3.Cint.Cint.
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import should_we_balance.Compound.Compound.
Require Import should_we_balance.A_schedule_cpumask.A_schedule_cpumask.
Open Scope Z_scope.
Theorem goal3 (t_1 : addr -> addr) (a : addr) (a_1 : addr) (a_2 : addr) (t : Z -> Z) : let a_3 : addr := shift (t_1 (shift a 0%Z)) 0%Z in let a_4 : addr := shift (t_1 (shift a_1 0%Z)) 0%Z in let a_5 : addr := shift (t_1 (shift a_2 0%Z)) 0%Z in ¬ Mk_addr 0%Z 0%Z = a_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> framed t_1 -> linked t -> valid_rd t a 1%Z -> valid_rd t a_1 1%Z -> valid_rd t a_2 1%Z -> valid_rd t a_3 l_size -> valid_rd t a_4 l_size -> valid_rw t a_5 l_size -> (¬ a_2 = a -> separated a_5 l_size a_3 l_size) -> (¬ a_2 = a_1 -> separated a_5 l_size a_4 l_size) -> (∀(i : Z), 0%Z ≤ i -> i < l_size -> separated a_5 l_size (shift (t_1 (shift (l_cpu_smt_mask i) 0%Z)) 0%Z) l_size) -> 0%Z ≤ l_size.
Admitted.
