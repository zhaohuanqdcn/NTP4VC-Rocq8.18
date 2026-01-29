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
Theorem goal0 (r : R) (i_2 : Z) (i : Z) (i_3 : Z) (i_1 : Z) (a : addr) (t_1 : addr -> addr) (t : Z -> Z) (fact0 : Rle 0%R r) (fact1 : i_2 ≤ i) (fact2 : i_3 ≤ i_1) (fact3 : 0%Z ≤ i_2) (fact4 : i ≤ i_2) (fact5 : 0%Z ≤ i_3) (fact6 : i_3 < i_1) (fact7 : region (base a) ≤ 0%Z) (fact8 : framed t_1) (fact9 : linked t) (fact10 : is_sint32 i) (fact11 : is_sint32 i_1) (fact12 : is_sint32 i_2) (fact13 : is_sint32 i_3) (fact14 : is_float32 r) (fact15 : is_sint32 (1%Z + i_3)) (fact16 : p_rvalid_float_mat_2' t t_1 a i_1 i) : - 1%Z ≤ i_3.
Proof.
Admitted.
