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
Theorem goal2 (r : R) (r_1 : R) (i_2 : Z) (i : Z) (i_3 : Z) (i_1 : Z) (a : addr) (t_1 : addr -> addr) (t : Z -> Z) (fact0 : Rle 0%R r) (fact1 : Rle r r_1) (fact2 : i_2 ≤ i) (fact3 : i_3 ≤ i_1) (fact4 : 0%Z ≤ i_2) (fact5 : i ≤ i_2) (fact6 : 0%Z ≤ i_3) (fact7 : i_3 < i_1) (fact8 : region (base a) ≤ 0%Z) (fact9 : framed t_1) (fact10 : linked t) (fact11 : is_sint32 i) (fact12 : is_sint32 i_1) (fact13 : is_sint32 i_2) (fact14 : is_sint32 i_3) (fact15 : is_float32 r) (fact16 : is_float32 r_1) (fact17 : p_rvalid_float_mat_2' t t_1 a i_1 i) : Rle 0%R r_1.
Admitted.
