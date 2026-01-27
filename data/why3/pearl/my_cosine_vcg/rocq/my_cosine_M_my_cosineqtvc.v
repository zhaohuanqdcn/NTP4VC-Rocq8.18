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
Require Import Why3.floating_point.Single.
Open Scope Z_scope.
Theorem my_cosine'vc (x : single) (o1 : single) (fact0 : Rle (Rabs (value x)) (Rdiv 1%R 32)) (fact1 : value o1 = Rdiv 1%R 2) : no_overflow NearestTiesToEven (Rmult (value x) (value x)) ∧ (∀(o2 : single), value o2 = round NearestTiesToEven (Rmult (value x) (value x)) -> no_overflow NearestTiesToEven (Rmult (value o2) (value o1)) ∧ (∀(o3 : single), value o3 = round NearestTiesToEven (Rmult (value o2) (value o1)) -> (∀(o4 : single), value o4 = 1%R -> no_overflow NearestTiesToEven (Rminus (value o4) (value o3)) ∧ (∀(result : single), value result = round NearestTiesToEven (Rminus (value o4) (value o3)) -> Rle (Rabs (Rminus (value result) (cos (value x)))) (Rdiv 1%R 8388608))))).
Admitted.
