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
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_mat_inv_4d.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (a : addr) (a_1 : addr) (t : Z -> Z) (r : R) (fact0 : region (base a) ≤ 0%Z) (fact1 : region (base a_1) ≤ 0%Z) (fact2 : linked t) (fact3 : is_float32 r) (fact4 : valid_rd t (shift a 0%Z) 16%Z) (fact5 : valid_rw t (shift a_1 0%Z) 16%Z) : is_finite32 r.
Proof.
Admitted.
