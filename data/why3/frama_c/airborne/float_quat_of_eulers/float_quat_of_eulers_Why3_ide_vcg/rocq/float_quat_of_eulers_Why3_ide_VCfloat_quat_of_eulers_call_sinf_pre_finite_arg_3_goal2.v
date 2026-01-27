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
Require Import float_quat_of_eulers.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_quat_of_eulers.Compound.Compound.
Require Import Why3.Square.Square.
Open Scope Z_scope.
Theorem goal2 (t_1 : addr -> R) (a : addr) (t : Z -> Z) : let r : R := t_1 (shift a 0%Z) in let r_1 : R := Rdiv r 2%R in let r_2 : R := sin r_1 in let r_3 : R := t_1 (shift a 1%Z) in let r_4 : R := Rdiv r_3 2%R in let r_5 : R := sin r_4 in let r_6 : R := cos r_1 in let r_7 : R := cos r_4 in let r_8 : R := t_1 (shift a 2%Z) in let r_9 : R := Rdiv r_8 2%R in region (base a) ≤ 0%Z -> Rle r_2 1%R -> Rle r_5 1%R -> Rle r_6 1%R -> Rle r_7 1%R -> Rle (Ropp 1%R) r_2 -> Rle (Ropp 1%R) r_5 -> Rle (Ropp 1%R) r_6 -> Rle (Ropp 1%R) r_7 -> linked t -> p_rvalid_floateulers t t_1 a -> is_float32 r -> is_float32 r_8 -> is_float32 r_3 -> is_finite32 r_1 -> is_finite32 r_4 -> is_float32 r_1 -> is_float32 r_9 -> is_float32 r_4 -> is_finite32 r_2 -> is_finite32 r_5 -> is_finite32 r_6 -> is_finite32 r_7 -> is_float32 r_2 -> is_float32 r_5 -> is_float32 r_6 -> is_float32 r_7 -> is_finite32 r_9.
Admitted.
