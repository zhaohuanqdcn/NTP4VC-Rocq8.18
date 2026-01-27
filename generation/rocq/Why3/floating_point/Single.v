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
Require Import Why3.floating_point.Rounding.
Require Import Why3.floating_point.SingleFormat.
Open Scope Z_scope.
Axiom round : mode -> R -> R.
Axiom value : single -> R.
Axiom exact : single -> R.
Axiom model : single -> R.
Definition round_error (x : single) : R := Rabs (Rminus (value x) (exact x)).
Definition total_error (x : single) : R := Rabs (Rminus (value x) (model x)).
Definition no_overflow (m : mode) (x : R) := Rle (Rabs (round m x)) 340282346638528859811704183484516925440%R.
Axiom Bounded_real_no_overflow : forall  (x : R) (m : mode) (fact0 : Rle (Rabs x) 340282346638528859811704183484516925440%R), no_overflow m x.
Axiom Round_monotonic : forall  (x : R) (y : R) (m : mode) (fact0 : Rle x y), Rle (round m x) (round m y).
Axiom Round_idempotent : forall  (m1 : mode) (m2 : mode) (x : R), round m1 (round m2 x) = round m2 x.
Axiom Round_value : forall  (m : mode) (x : single), round m (value x) = value x.
Axiom Bounded_value : forall  (x : single), Rle (Rabs (value x)) 340282346638528859811704183484516925440%R.
Axiom Exact_rounding_for_integers : forall  (i : Z) (m : mode) (fact0 : - 16777216%Z ≤ i) (fact1 : i ≤ 16777216%Z), round m (Rdefinitions.IZR i) = Rdefinitions.IZR i.
Axiom Round_down_le : forall  (x : R), Rle (round Down x) x.
Axiom Round_up_ge : forall  (x : R), Rle x (round Up x).
Axiom Round_down_neg : forall  (x : R), round Down (Ropp x) = Ropp (round Up x).
Axiom Round_up_neg : forall  (x : R), round Up (Ropp x) = Ropp (round Down x).
Axiom round_logic : mode -> R -> single.
Axiom Round_logic_def : forall  (m : mode) (x : R) (fact0 : no_overflow m x), value (round_logic m x) = round m x.
Definition of_real_post (m : mode) (x : R) (res : single) := value res = round m x ∧ exact res = x ∧ model res = x.
Definition add_post (m : mode) (x : single) (y : single) (res : single) := value res = round m (Rplus (value x) (value y)) ∧ exact res = Rplus (exact x) (exact y) ∧ model res = Rplus (model x) (model y).
Definition sub_post (m : mode) (x : single) (y : single) (res : single) := value res = round m (Rminus (value x) (value y)) ∧ exact res = Rminus (exact x) (exact y) ∧ model res = Rminus (model x) (model y).
Definition mul_post (m : mode) (x : single) (y : single) (res : single) := value res = round m (Rmult (value x) (value y)) ∧ exact res = Rmult (exact x) (exact y) ∧ model res = Rmult (model x) (model y).
Definition div_post (m : mode) (x : single) (y : single) (res : single) := value res = round m (Rdiv (value x) (value y)) ∧ exact res = Rdiv (exact x) (exact y) ∧ model res = Rdiv (model x) (model y).
Definition neg_post (x : single) (res : single) := value res = Ropp (value x) ∧ exact res = Ropp (exact x) ∧ model res = Ropp (model x).
Definition lt (x : single) (y : single) := Rlt (value x) (value y).
Definition gt (x : single) (y : single) := Rlt (value y) (value x).
