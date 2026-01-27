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
Require Import int32_quat_comp_norm_shortest.Compound.Compound.
Require Import int32_quat_comp_norm_shortest.Axiomatic15.Axiomatic15.
Open Scope Z_scope.
Theorem goal1 (t_1 : addr -> Z) (a_1 : addr) (a : addr) (t : Z -> Z) : let x : Z := t_1 (shift a_1 0%Z) in let x_1 : Z := t_1 (shift a_1 1%Z) in let x_2 : Z := t_1 (shift a_1 2%Z) in let x_3 : Z := t_1 (shift a_1 3%Z) in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> separated a_1 4%Z a 4%Z -> is_sint32 (t_1 (shift a 0%Z)) -> is_sint32 x -> is_sint32 (t_1 (shift a 1%Z)) -> is_sint32 x_1 -> is_sint32 (t_1 (shift a 2%Z)) -> is_sint32 x_2 -> is_sint32 (t_1 (shift a 3%Z)) -> is_sint32 x_3 -> p_rvalid_bound_int32quat t t_1 a 13777%Z -> p_rvalid_bound_int32quat t t_1 a_1 13777%Z -> - 23170%Z ≤ x ∧ - 23170%Z ≤ x_1 ∧ - 23170%Z ≤ x_2 ∧ - 23170%Z ≤ x_3 ∧ x ≤ 23170%Z ∧ x_1 ≤ 23170%Z ∧ x_2 ≤ 23170%Z ∧ x_3 ≤ 23170%Z.
Admitted.
