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
Require Import double_quat_of_eulers.Axiomatic19.Axiomatic19.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import double_quat_of_eulers.Compound.Compound.
Open Scope Z_scope.
Theorem goal2 (t_1 : addr -> R) (a : addr) (r : R) (r_1 : R) (r_2 : R) (r_3 : R) (t : Z -> Z) : let r_4 : R := t_1 (shift a 0%Z) in let r_5 : R := t_1 (shift a 2%Z) in let r_6 : R := t_1 (shift a 1%Z) in let r_7 : R := Rdiv r_4 2%R in let r_8 : R := Rdiv r_6 2%R in let r_9 : R := Rdiv r_5 2%R in Rle r 1%R -> Rle r_1 1%R -> Rle r_2 1%R -> Rle r_3 1%R -> Rle (Ropp 1%R) r -> Rle (Ropp 1%R) r_1 -> Rle (Ropp 1%R) r_2 -> Rle (Ropp 1%R) r_3 -> region (base a) ≤ 0%Z -> linked t -> is_finite64 r -> is_finite64 r_1 -> is_finite64 r_2 -> is_finite64 r_3 -> is_float64 r -> is_float64 r_1 -> is_float64 r_2 -> is_float64 r_3 -> p_rvalid_doubleeulers t t_1 a -> is_float64 r_4 -> is_float64 r_5 -> is_float64 r_6 -> is_finite64 r_7 -> is_finite64 r_8 -> is_float64 r_7 -> is_float64 r_9 -> is_float64 r_8 -> is_finite64 r_9.
Proof.
Admitted.
