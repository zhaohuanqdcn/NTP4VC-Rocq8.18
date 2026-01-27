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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (a_5 : addr) (a_4 : addr) (a_3 : addr) (a_2 : addr) (a_11 : addr) (a_10 : addr) (a_9 : addr) (a_8 : addr) (a_16 : addr) (a_17 : addr) (t : Z -> Z) (i : Z) (a : addr) (a_1 : addr) (a_6 : addr) (a_7 : addr) (t_1 : addr -> Z) (a_13 : addr) (a_12 : addr) (a_15 : addr) (a_14 : addr) (fact0 : (base a_5 = base a_4) = (base a_3 = base a_2)) (fact1 : (base a_11 = base a_10) = (base a_9 = base a_8)) (fact2 : region (base a_16) ≤ 0%Z) (fact3 : region (base a_17) ≤ 0%Z) (fact4 : linked t) (fact5 : is_uint64 i) (fact6 : valid_rd t (shift a 0%Z) i) (fact7 : valid_rd t (shift a_1 0%Z) i) (fact8 : valid_rd t (shift a_6 0%Z) i) (fact9 : valid_rd t (shift a_7 0%Z) i) : (∀(i_1 : Z), t_1 (shift a_13 i_1) = t_1 (shift a_12 i_1) ∨ i_1 < 0%Z ∨ i ≤ i_1) ∨ (∃(i_1 : Z), ¬ t_1 (shift a_15 i_1) = t_1 (shift a_14 i_1) ∧ 0%Z ≤ i_1 ∧ i_1 < i).
Admitted.
