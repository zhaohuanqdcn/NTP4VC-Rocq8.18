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
Require Import float_quat_comp_norm_shortest.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_quat_comp_norm_shortest.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (a : addr) (a_2 : addr) (t : Z -> Z) (t_1 : addr -> R) : let a_3 : addr := shift a_1 0%Z in let a_4 : addr := shift a 0%Z in let a_5 : addr := shift a_2 0%Z in let a_6 : addr := shift a 1%Z in let a_7 : addr := shift a_1 1%Z in let a_8 : addr := shift a_2 1%Z in let a_9 : addr := shift a 2%Z in let a_10 : addr := shift a_1 2%Z in let a_11 : addr := shift a_2 2%Z in let a_12 : addr := shift a 3%Z in let a_13 : addr := shift a_1 3%Z in let a_14 : addr := shift a_2 3%Z in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> linked t -> valid_rw t a_1 4%Z -> p_rvalid_floatquat t t_1 a -> p_rvalid_floatquat t t_1 a_2 -> ¬ a_3 = a_4 ∧ ¬ a_5 = a_4 ∧ ¬ a_5 = a_3 ∧ ¬ a_6 = a_3 ∧ ¬ a_6 = a_5 ∧ ¬ a_7 = a_4 ∧ ¬ a_7 = a_5 ∧ ¬ a_7 = a_6 ∧ ¬ a_8 = a_4 ∧ ¬ a_8 = a_3 ∧ ¬ a_8 = a_6 ∧ ¬ a_8 = a_7 ∧ ¬ a_9 = a_3 ∧ ¬ a_9 = a_5 ∧ ¬ a_9 = a_7 ∧ ¬ a_9 = a_8 ∧ ¬ a_10 = a_4 ∧ ¬ a_10 = a_5 ∧ ¬ a_10 = a_6 ∧ ¬ a_10 = a_8 ∧ ¬ a_10 = a_9 ∧ ¬ a_11 = a_4 ∧ ¬ a_11 = a_3 ∧ ¬ a_11 = a_6 ∧ ¬ a_11 = a_7 ∧ ¬ a_11 = a_9 ∧ ¬ a_11 = a_10 ∧ ¬ a_12 = a_3 ∧ ¬ a_12 = a_5 ∧ ¬ a_12 = a_7 ∧ ¬ a_12 = a_8 ∧ ¬ a_12 = a_10 ∧ ¬ a_12 = a_11 ∧ ¬ a_13 = a_4 ∧ ¬ a_13 = a_5 ∧ ¬ a_13 = a_6 ∧ ¬ a_13 = a_8 ∧ ¬ a_13 = a_9 ∧ ¬ a_13 = a_11 ∧ ¬ a_13 = a_12 ∧ ¬ a_14 = a_4 ∧ ¬ a_14 = a_3 ∧ ¬ a_14 = a_6 ∧ ¬ a_14 = a_7 ∧ ¬ a_14 = a_9 ∧ ¬ a_14 = a_10 ∧ ¬ a_14 = a_12 ∧ ¬ a_14 = a_13.
Admitted.
