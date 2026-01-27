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
Theorem goal0 (a : addr) (t_1 : addr -> Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let x : Z := t_1 (shift a_1 0%Z) in let x_1 : Z := t_1 (shift a_1 4%Z) in let x_2 : Z := t_1 (shift a_1 8%Z) in let x_3 : Z := x + x_1 + x_2 in region (base a) ≤ 0%Z -> 0%Z < x_3 -> linked t -> p_rvalid_bound_int32rmat t t_1 a 32767%Z -> is_sint32 x -> is_sint32 x_1 -> is_sint32 x_2 -> is_sint32 x_3 -> to_uint32 (lsl (to_sint32 (truncate (Rplus (Rmult 1%R 16384%R) (Rdefinitions.IZR x_3)))) 14%Z) ≤ 2147483647%Z.
Admitted.
