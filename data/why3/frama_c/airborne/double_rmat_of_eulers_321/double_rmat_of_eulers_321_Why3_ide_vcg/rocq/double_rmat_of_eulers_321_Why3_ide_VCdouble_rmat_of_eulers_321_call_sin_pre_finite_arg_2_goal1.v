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
Require Import double_rmat_of_eulers_321.Axiomatic19.Axiomatic19.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import double_rmat_of_eulers_321.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (t_1 : addr -> R) (a : addr) (r : R) (r_1 : R) (t : Z -> Z) : let r_2 : R := t_1 (shift a 0%Z) in let r_3 : R := t_1 (shift a 1%Z) in Rle r 1%R -> Rle r_1 1%R -> Rle (Ropp 1%R) r -> Rle (Ropp 1%R) r_1 -> region (base a) ≤ 0%Z -> linked t -> is_finite64 r -> is_finite64 r_1 -> is_float64 r -> is_float64 r_1 -> p_rvalid_doubleeulers t t_1 a -> is_finite64 r_2 -> is_float64 r_2 -> is_float64 (t_1 (shift a 2%Z)) -> is_float64 r_3 -> is_finite64 r_3.
Admitted.
