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
Require Import float_rmat_of_eulers_321.Compound.Compound.
Open Scope Z_scope.
Definition p_finite_floateulers (mflt_0 : addr -> R) (e : addr) := is_finite32 (mflt_0 (shift e 0%Z)) ∧ is_finite32 (mflt_0 (shift e 2%Z)) ∧ is_finite32 (mflt_0 (shift e 1%Z)).
Definition p_rvalid_floateulers (malloc_0 : Z -> Z) (mflt_0 : addr -> R) (e : addr) := p_finite_floateulers mflt_0 e ∧ valid_rd malloc_0 e 3%Z.
