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
Require Import Why3.real.Truncate.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import int32_quat_of_rmat.Compound.Compound.
Require Import int32_quat_of_rmat.Axiomatic15.Axiomatic15.
Require Import Why3.Cint.Cint.
Require Import Why3.Cbits.Cbits.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Open Scope Z_scope.
Theorem goal3 (a : addr) (t_1 : addr -> Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let x : Z := t_1 (shift a_1 4%Z) in let x_1 : Z := t_1 (shift a_1 8%Z) in let x_2 : Z := t_1 (shift a_1 0%Z) in let x_3 : Z := x_2 + x + x_1 in region (base a) ≤ 0%Z -> x ≤ x_1 -> x_3 ≤ 0%Z -> linked t -> p_rvalid_bound_int32rmat t t_1 a 32767%Z -> is_sint32 x_2 -> is_sint32 (t_1 (shift a_1 1%Z)) -> is_sint32 (t_1 (shift a_1 2%Z)) -> is_sint32 (t_1 (shift a_1 3%Z)) -> is_sint32 x -> is_sint32 (t_1 (shift a_1 5%Z)) -> is_sint32 (t_1 (shift a_1 6%Z)) -> is_sint32 (t_1 (shift a_1 7%Z)) -> is_sint32 x_1 -> is_sint32 x_3 -> x_2 ≤ x ∨ x_2 ≤ x_1 -> to_uint32 (lsl (to_sint32 (truncate (Rplus (Rdefinitions.IZR (x_1 - x_2 - x)) (Rmult 1%R 16384%R)))) 14%Z) ≤ 2147483647%Z.
Proof.
Admitted.
