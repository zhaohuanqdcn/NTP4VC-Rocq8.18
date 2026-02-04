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
Require Import float_quat_of_rmat.S11_RealQuat_s.S11_RealQuat_s.
Require Import float_quat_of_rmat.Compound.Compound.
Open Scope Z_scope.
Definition l_l_quat_of_floatquat (mflt_0 : addr -> R) (q : addr) : s11_realquat_s := s11_realquat_s'mk (mflt_0 (shift q 0%Z)) (mflt_0 (shift q 1%Z)) (mflt_0 (shift q 2%Z)) (mflt_0 (shift q 3%Z)).
