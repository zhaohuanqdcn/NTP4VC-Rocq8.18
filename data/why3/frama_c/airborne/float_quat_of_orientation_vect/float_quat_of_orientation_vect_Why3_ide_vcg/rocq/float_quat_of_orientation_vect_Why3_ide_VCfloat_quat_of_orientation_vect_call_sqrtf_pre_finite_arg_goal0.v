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
Require Import float_quat_of_orientation_vect.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_quat_of_orientation_vect.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> R) (a : addr) (t : Z -> Z) : let r : R := t_1 (shift a 0%Z) in let r_1 : R := t_1 (shift a 1%Z) in let r_2 : R := t_1 (shift a 2%Z) in region (base a) ≤ 0%Z -> linked t -> p_rvalid_floatvect3 t t_1 a -> is_float32 r -> is_float32 r_1 -> is_float32 r_2 -> is_finite32 (Rplus (Rplus (Rmult r r) (Rmult r_1 r_1)) (Rmult r_2 r_2)).
Admitted.
