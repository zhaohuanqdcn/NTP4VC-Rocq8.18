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
Open Scope Z_scope.
Definition is_float32 (x : R) := True.
Definition is_float64 (x : R) := True.
Inductive rounding_mode :=
  | Up : rounding_mode
  | Down : rounding_mode
  | ToZero : rounding_mode
  | NearestTiesToAway : rounding_mode
  | NearestTiesToEven : rounding_mode.
Axiom rounding_mode_inhabited : Inhabited rounding_mode.
Global Existing Instance rounding_mode_inhabited.
Axiom rounding_mode_countable : Countable rounding_mode.
Global Existing Instance rounding_mode_countable.
Axiom round_double : rounding_mode -> R -> R.
Axiom round_float : rounding_mode -> R -> R.
Axiom float_32 : forall  (x : R), x = round_float NearestTiesToEven x.
Axiom float_64 : forall  (x : R), x = round_double NearestTiesToEven x.
Inductive float_kind :=
  | Real : float_kind
  | Float32 : float_kind
  | Float64 : float_kind
  | NaN : float_kind
  | Inf_pos : float_kind
  | Inf_neg : float_kind.
Axiom float_kind_inhabited : Inhabited float_kind.
Global Existing Instance float_kind_inhabited.
Axiom float_kind_countable : Countable float_kind.
Global Existing Instance float_kind_countable.
Axiom classify_float : R -> float_kind.
Definition is_finite32 (x : R) := classify_float x = Float32.
Definition is_finite64 (x : R) := classify_float x = Float32 ∨ classify_float x = Float64.
Definition is_NaN (x : R) := classify_float x = NaN.
Definition is_infinite (x : R) := classify_float x = Inf_pos ∨ classify_float x = Inf_neg.
Definition is_positive_infinite (x : R) := classify_float x = Inf_pos.
Definition is_negative_infinite (x : R) := classify_float x = Inf_neg.
Axiom is_finite_to_float_32 : forall  (x : R), is_finite32 x.
Axiom is_finite_to_float_64 : forall  (x : R), is_finite64 x.
Axiom model : R -> R.
Definition delta (x : R) : R := Rabs (Rminus x (model x)).
Definition error (x : R) : R := Rdiv (delta x) (Rabs (model x)).
Axiom model_float_32 : True.
Axiom model_float_64 : True.
Axiom model_add : forall  (x : R) (y : R), model (Rplus x y) = Rplus (model x) (model y).
Axiom model_mul : forall  (x : R) (y : R), model (Rmult x y) = Rmult (model x) (model y).
Axiom model_div : forall  (x : R) (y : R), model (Rdiv x y) = Rdiv (model x) (model y).
Axiom model_sqrt : forall  (x : R), model (sqrt x) = sqrt (model x).
