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
Require Import Why3.Cint.Cint.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_mat_norm_li.Axiomatic15.Axiomatic15.
Require Import float_mat_norm_li.Compound.Compound.
Open Scope Z_scope.
Theorem goal3 (t_1 : addr -> R) (t_2 : addr -> addr) (a : addr) (i_3 : Z) (i_2 : Z) (r : R) (i : Z) (i_1 : Z) (r_1 : R) (t : Z -> Z) : let r_2 : R := t_1 (shift (t_2 (shift a i_3)) i_2) in Rle 0%R r -> i_2 ≤ i -> i_3 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i -> 0%Z ≤ i_3 -> i_3 < i_1 -> Rle 0%R r_1 -> region (base a) ≤ 0%Z -> framed t_2 -> linked t -> is_finite32 r_1 -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 i_3 -> is_float32 r -> is_float32 r_1 -> is_sint32 (1%Z + i_2) -> p_rvalid_float_mat_2' t t_2 a i_1 i -> is_finite32 r_2 -> is_float32 r_2 -> r_2 = r_1 ∨ Rplus r_1 r_2 = 0%R -> - 1%Z ≤ i_2.
Admitted.
