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
Require Import float_quat_of_orientation_vect.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_quat_of_orientation_vect.Compound.Compound.
Open Scope Z_scope.
Theorem goal2 (t_1 : addr -> R) (a : addr) (r : R) (t : Z -> Z) : let r_2 : R := t_1 (shift a 0%Z) in let r_3 : R := t_1 (shift a 1%Z) in let r_4 : R := t_1 (shift a 2%Z) in let r_5 : R := Rplus (Rplus (Rmult r_2 r_2) (Rmult r_3 r_3)) (Rmult r_4 r_4) in Rle 0%R r -> Rle (Rdiv 3022314549036573%R 302231454903657293676544%R) r -> region (base a) ≤ 0%Z -> Rle 0%R r_5 -> linked t -> is_finite32 r -> is_float32 r -> p_rvalid_floatvect3 t t_1 a -> is_float32 r_2 -> is_float32 r_3 -> is_float32 r_4 -> is_finite32 r_5 -> is_finite32 (Rdiv r 2%R).
Proof.
Admitted.
