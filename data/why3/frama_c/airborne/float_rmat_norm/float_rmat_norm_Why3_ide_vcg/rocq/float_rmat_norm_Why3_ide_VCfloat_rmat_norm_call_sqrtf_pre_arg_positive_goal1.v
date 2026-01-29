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
Require Import float_rmat_norm.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_rmat_norm.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (a : addr) (t_1 : addr -> R) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let r : R := t_1 (shift a_1 0%Z) in let r_1 : R := t_1 (shift a_1 1%Z) in let r_2 : R := t_1 (shift a_1 2%Z) in let r_3 : R := t_1 (shift a_1 3%Z) in let r_4 : R := t_1 (shift a_1 4%Z) in let r_5 : R := t_1 (shift a_1 5%Z) in let r_6 : R := t_1 (shift a_1 6%Z) in let r_7 : R := t_1 (shift a_1 7%Z) in let r_8 : R := t_1 (shift a_1 8%Z) in region (base a) ≤ 0%Z -> linked t -> p_rvalid_floatrmat t t_1 a -> is_float32 r -> is_float32 r_1 -> is_float32 r_2 -> is_float32 r_3 -> is_float32 r_4 -> is_float32 r_5 -> is_float32 r_6 -> is_float32 r_7 -> is_float32 r_8 -> Rle 0%R (Rplus (Rplus (Rplus (Rplus (Rplus (Rplus (Rplus (Rplus (Rmult r r) (Rmult r_1 r_1)) (Rmult r_2 r_2)) (Rmult r_3 r_3)) (Rmult r_4 r_4)) (Rmult r_5 r_5)) (Rmult r_6 r_6)) (Rmult r_7 r_7)) (Rmult r_8 r_8)).
Proof.
Admitted.
