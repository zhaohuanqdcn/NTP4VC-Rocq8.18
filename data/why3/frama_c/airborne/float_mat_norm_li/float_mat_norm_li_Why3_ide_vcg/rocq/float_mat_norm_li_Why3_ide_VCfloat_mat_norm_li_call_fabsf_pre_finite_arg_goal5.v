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
Require Import Why3.Cint.Cint.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_mat_norm_li.Axiomatic15.Axiomatic15.
Require Import float_mat_norm_li.Compound.Compound.
Open Scope Z_scope.
Theorem goal5 (t_1 : addr -> R) (t_2 : addr -> addr) (a : addr) (i_3 : Z) (i_2 : Z) (r : R) (i : Z) (i_1 : Z) (t : Z -> Z) : let r_1 : R := t_1 (shift (t_2 (shift a i_3)) i_2) in Rle 0%R r -> i_2 ≤ i -> i_3 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i -> 0%Z ≤ i_3 -> i_3 < i_1 -> region (base a) ≤ 0%Z -> framed t_2 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 i_3 -> is_float32 r -> p_rvalid_float_mat_2' t t_2 a i_1 i -> is_float32 r_1 -> is_finite32 r_1.
Proof.
Admitted.
