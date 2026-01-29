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
Require Import float_rmat_of_axis_angle.Axiomatic15.Axiomatic15.
Require Import float_rmat_of_axis_angle.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a : addr) (t : Z -> Z) (r : R) (t_1 : addr -> R) (fact0 : region (base a) ≤ 0%Z) (fact1 : linked t) (fact2 : is_float32 r) (fact3 : p_rvalid_floatvect3 t t_1 a) (fact4 : is_float32 (t_1 (shift a 0%Z))) (fact5 : is_float32 (t_1 (shift a 1%Z))) (fact6 : is_float32 (t_1 (shift a 2%Z))) : is_finite32 r.
Proof.
Admitted.
