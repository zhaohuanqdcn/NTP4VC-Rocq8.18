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
Require Import float_rates_of_euler_dot.Axiomatic15.Axiomatic15.
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_rates_of_euler_dot.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> R) (a_1 : addr) (a : addr) (t : Z -> Z) : let r : R := t_1 (shift a_1 1%Z) in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> p_rvalid_floateulers t t_1 a -> p_rvalid_floateulers t t_1 a_1 -> is_float32 (t_1 (shift a 0%Z)) -> is_float32 (t_1 (shift a_1 0%Z)) -> is_float32 (t_1 (shift a 2%Z)) -> is_float32 (t_1 (shift a 1%Z)) -> is_float32 r -> is_finite32 r.
Proof.
Admitted.
