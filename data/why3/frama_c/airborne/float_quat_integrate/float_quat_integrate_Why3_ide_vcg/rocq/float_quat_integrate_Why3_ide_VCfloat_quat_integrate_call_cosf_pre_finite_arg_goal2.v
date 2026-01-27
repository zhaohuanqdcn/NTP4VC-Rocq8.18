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
Require Import float_quat_integrate.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_quat_integrate.Compound.Compound.
Open Scope Z_scope.
Theorem goal2 (t_1 : addr -> R) (a : addr) (r : R) (r_1 : R) (t : Z -> Z) : let r_3 : R := t_1 (shift a 0%Z) in let r_4 : R := t_1 (shift a 1%Z) in let r_5 : R := t_1 (shift a 2%Z) in let r_6 : R := Rplus (Rplus (Rmult r_3 r_3) (Rmult r_4 r_4)) (Rmult r_5 r_5) in let r_7 : R := Rmult (Rmult (Rdiv 1%R 2%R) r) r_1 in Rle 0%R r -> Rlt (Rdiv 1%R 85070591730234615865843651857942052864%R) r -> region (base a) ≤ 0%Z -> Rle 0%R r_6 -> linked t -> is_finite32 r -> is_float32 r -> is_float32 r_1 -> p_rvalid_floatrates t t_1 a -> is_float32 r_3 -> is_float32 r_4 -> is_float32 r_5 -> is_float32 r_7 -> is_finite32 r_6 -> is_finite32 r_7.
Admitted.
