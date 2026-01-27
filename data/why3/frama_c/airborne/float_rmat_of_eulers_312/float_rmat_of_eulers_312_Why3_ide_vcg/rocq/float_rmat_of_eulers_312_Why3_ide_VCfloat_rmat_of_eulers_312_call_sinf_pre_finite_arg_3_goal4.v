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
Require Import Why3.Cmath.Cmath.
Require Import Why3.Square.Square.
Require Import float_rmat_of_eulers_312.Compound.Compound.
Require Import float_rmat_of_eulers_312.Axiomatic15.Axiomatic15.
Require Import Why3.Cfloat.Cfloat.
Open Scope Z_scope.
Theorem goal4 (t_1 : addr -> R) (a_1 : addr) (a : addr) (t : Z -> Z) : let r : R := t_1 (shift a_1 0%Z) in let r_1 : R := sin r in let r_2 : R := t_1 (shift a_1 1%Z) in let r_3 : R := sin r_2 in let r_4 : R := cos r in let r_5 : R := cos r_2 in let r_6 : R := t_1 (shift a_1 2%Z) in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> Rle r_1 1%R -> Rle r_3 1%R -> Rle r_4 1%R -> Rle r_5 1%R -> Rle (Ropp 1%R) r_1 -> Rle (Ropp 1%R) r_3 -> Rle (Ropp 1%R) r_4 -> Rle (Ropp 1%R) r_5 -> linked t -> valid_rw t a 9%Z -> p_rvalid_floateulers t t_1 a_1 -> is_finite32 r -> is_finite32 r_2 -> is_float32 r -> is_float32 r_6 -> is_float32 r_2 -> is_finite32 r_1 -> is_finite32 r_3 -> is_finite32 r_4 -> is_finite32 r_5 -> is_float32 r_1 -> is_float32 r_3 -> is_float32 r_4 -> is_float32 r_5 -> is_finite32 r_6.
Admitted.
