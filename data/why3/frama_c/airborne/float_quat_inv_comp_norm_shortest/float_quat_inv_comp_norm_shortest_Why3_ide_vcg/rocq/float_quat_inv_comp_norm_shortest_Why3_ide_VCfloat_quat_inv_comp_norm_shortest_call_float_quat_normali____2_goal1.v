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
Require Import float_quat_inv_comp_norm_shortest.S3_FloatQuat.S3_FloatQuat.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Open Scope Z_scope.
Theorem goal1 (f : s3_floatquat) (f_2 : s3_floatquat) (f_3 : s3_floatquat) (f_1 : s3_floatquat) : let r : R := f3_floatquat_qi f in let r_1 : R := f3_floatquat_qx f in let r_2 : R := f3_floatquat_qy f in let r_3 : R := f3_floatquat_qz f in let r_4 : R := f3_floatquat_qi f_2 in let r_5 : R := f3_floatquat_qx f_2 in let r_6 : R := f3_floatquat_qy f_2 in let r_7 : R := f3_floatquat_qz f_2 in let r_8 : R := f3_floatquat_qi f_3 in let r_9 : R := f3_floatquat_qx f_3 in let r_10 : R := f3_floatquat_qy f_3 in let r_11 : R := f3_floatquat_qz f_3 in let r_12 : R := f3_floatquat_qi f_1 in let r_13 : R := f3_floatquat_qx f_1 in let r_14 : R := f3_floatquat_qy f_1 in let r_15 : R := f3_floatquat_qz f_1 in is_finite32 r -> is_finite32 r_1 -> is_finite32 r_2 -> is_finite32 r_3 -> is_finite32 r_4 -> is_finite32 r_5 -> is_finite32 r_6 -> is_finite32 r_7 -> is_finite32 r_8 -> is_finite32 r_9 -> is_finite32 r_10 -> is_finite32 r_11 -> is_float32 r -> is_float32 r_1 -> is_float32 r_2 -> is_float32 r_3 -> is_float32 r_12 -> is_float32 r_13 -> is_float32 r_14 -> is_float32 r_15 -> is_float32 r_4 -> is_float32 r_5 -> is_float32 r_6 -> is_float32 r_7 -> is_float32 r_8 -> is_float32 r_9 -> is_float32 r_10 -> is_float32 r_11 -> is_finite32 r_12 ∧ is_finite32 r_13 ∧ is_finite32 r_14 ∧ is_finite32 r_15.
Admitted.
