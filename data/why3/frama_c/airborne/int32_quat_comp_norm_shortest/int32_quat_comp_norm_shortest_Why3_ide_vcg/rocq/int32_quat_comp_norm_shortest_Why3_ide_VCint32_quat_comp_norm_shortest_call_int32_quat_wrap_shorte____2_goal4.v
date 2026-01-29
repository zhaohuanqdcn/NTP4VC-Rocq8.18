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
Require Import int32_quat_comp_norm_shortest.Compound.Compound.
Require Import int32_quat_comp_norm_shortest.Axiomatic15.Axiomatic15.
Require Import int32_quat_comp_norm_shortest.S8_Int32Quat.S8_Int32Quat.
Open Scope Z_scope.
Theorem goal4 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (i : s8_int32quat) (t : Z -> Z) : let x : Z := t_1 (shift a 0%Z) in let x_1 : Z := t_1 (shift a_1 0%Z) in let x_2 : Z := t_1 (shift a 1%Z) in let x_3 : Z := t_1 (shift a_1 1%Z) in let x_4 : Z := t_1 (shift a 2%Z) in let x_5 : Z := t_1 (shift a_1 2%Z) in let x_6 : Z := t_1 (shift a 3%Z) in let x_7 : Z := t_1 (shift a_1 3%Z) in let x_8 : Z := f8_int32quat_qi i in let x_9 : Z := f8_int32quat_qx i in let x_10 : Z := f8_int32quat_qy i in let x_11 : Z := f8_int32quat_qz i in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 23170%Z ≤ x -> - 23170%Z ≤ x_1 -> - 23170%Z ≤ x_2 -> - 23170%Z ≤ x_3 -> - 23170%Z ≤ x_4 -> - 23170%Z ≤ x_5 -> - 23170%Z ≤ x_6 -> - 23170%Z ≤ x_7 -> x ≤ 23170%Z -> x_1 ≤ 23170%Z -> x_2 ≤ 23170%Z -> x_3 ≤ 23170%Z -> x_4 ≤ 23170%Z -> x_5 ≤ 23170%Z -> x_6 ≤ 23170%Z -> x_7 ≤ 23170%Z -> linked t -> is_sint32 x_8 -> is_sint32 x_9 -> is_sint32 x_10 -> is_sint32 x_11 -> valid_rd t a 4%Z -> valid_rd t a_1 4%Z -> separated a_1 4%Z a 4%Z -> is_sint32 x -> is_sint32 x_1 -> is_sint32 x_2 -> is_sint32 x_3 -> is_sint32 x_4 -> is_sint32 x_5 -> is_sint32 x_6 -> is_sint32 x_7 -> p_rvalid_bound_int32quat t t_1 a 13777%Z -> p_rvalid_bound_int32quat t t_1 a_1 13777%Z -> (p_bound_int32quat t_1 a 23170%Z -> p_bound_int32quat t_1 a_1 23170%Z -> - 65535%Z ≤ x_8 ∧ x_8 ≤ 65535%Z) -> (p_bound_int32quat t_1 a 23170%Z -> p_bound_int32quat t_1 a_1 23170%Z -> - 65535%Z ≤ x_9 ∧ x_9 ≤ 65535%Z) -> (p_bound_int32quat t_1 a 23170%Z -> p_bound_int32quat t_1 a_1 23170%Z -> - 65535%Z ≤ x_10 ∧ x_10 ≤ 65535%Z) -> (p_bound_int32quat t_1 a 23170%Z -> p_bound_int32quat t_1 a_1 23170%Z -> - 65535%Z ≤ x_11 ∧ x_11 ≤ 65535%Z) -> (p_bound_int32quat t_1 a 13777%Z -> p_bound_int32quat t_1 a_1 13777%Z -> - 23170%Z ≤ x_8 ∧ x_8 ≤ 23170%Z) -> (p_bound_int32quat t_1 a 13777%Z -> p_bound_int32quat t_1 a_1 13777%Z -> - 23170%Z ≤ x_9 ∧ x_9 ≤ 23170%Z) -> (p_bound_int32quat t_1 a 13777%Z -> p_bound_int32quat t_1 a_1 13777%Z -> - 23170%Z ≤ x_10 ∧ x_10 ≤ 23170%Z) -> (p_bound_int32quat t_1 a 13777%Z -> p_bound_int32quat t_1 a_1 13777%Z -> - 23170%Z ≤ x_11 ∧ x_11 ≤ 23170%Z) -> - 2147483647%Z ≤ x_8 ∧ - 2147483647%Z ≤ x_9 ∧ - 2147483647%Z ≤ x_10 ∧ - 2147483647%Z ≤ x_11 ∧ x_8 ≤ 2147483647%Z ∧ x_9 ≤ 2147483647%Z ∧ x_10 ≤ 2147483647%Z ∧ x_11 ≤ 2147483647%Z.
Proof.
Admitted.
