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
Require Import Why3.Cint.Cint.
Require Import should_we_balance.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (i_1 : Z) (i : Z) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) (fact0 : i_1 < i) (fact1 : i ≤ l_size) (fact2 : region (base a) ≤ 0%Z) (fact3 : linked t) (fact4 : is_uint32 i) (fact5 : is_uint32 i_1) (fact6 : valid_rd t (shift a 0%Z) i) : ((∃(i_2 : Z), ¬ t_1 (shift a i_2) = 0%Z ∧ 0%Z ≤ i_2 ∧ i_2 < i) ∨ (∀(i_2 : Z), t_1 (shift a i_2) = 0%Z ∨ i ≤ i_2 ∨ i_2 < i_1)) ∧ ((∃(i_2 : Z), ¬ t_1 (shift a i_2) = 0%Z ∧ 0%Z ≤ i_2 ∧ i_2 < i) ∨ (∀(i_2 : Z), t_1 (shift a i_2) = 0%Z ∨ i_2 < 0%Z ∨ i_1 ≤ i_2) ∨ (∃(i_2 : Z), ¬ t_1 (shift a i_2) = 0%Z ∧ i_2 < i ∧ i_1 ≤ i_2)).
Admitted.
