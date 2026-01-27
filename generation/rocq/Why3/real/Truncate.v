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
Open Scope Z_scope.
Axiom truncate : R -> Z.
Axiom Truncate_int : forall  (i : Z), truncate (Rdefinitions.IZR i) = i.
Axiom Truncate_down_pos : forall  (x : R) (fact0 : Rle 0%R x), Rle (Rdefinitions.IZR (truncate x)) x ∧ Rlt x (Rdefinitions.IZR (truncate x + 1%Z)).
Axiom Truncate_up_neg : forall  (x : R) (fact0 : Rle x 0%R), Rlt (Rdefinitions.IZR (truncate x - 1%Z)) x ∧ Rle x (Rdefinitions.IZR (truncate x)).
Axiom Real_of_truncate : forall  (x : R), Rle (Rminus x 1%R) (Rdefinitions.IZR (truncate x)) ∧ Rle (Rdefinitions.IZR (truncate x)) (Rplus x 1%R).
Axiom Truncate_monotonic : forall  (x : R) (y : R) (fact0 : Rle x y), truncate x ≤ truncate y.
Axiom Truncate_monotonic_int1 : forall  (x : R) (i : Z) (fact0 : Rle x (Rdefinitions.IZR i)), truncate x ≤ i.
Axiom Truncate_monotonic_int2 : forall  (i : Z) (x : R) (fact0 : Rle (Rdefinitions.IZR i) x), i ≤ truncate x.
Axiom floor : R -> Z.
Axiom Floor_int : forall  (i : Z), floor (Rdefinitions.IZR i) = i.
Axiom ceil : R -> Z.
Axiom Ceil_int : forall  (i : Z), ceil (Rdefinitions.IZR i) = i.
Axiom Floor_down : forall  (x : R), Rle (Rdefinitions.IZR (floor x)) x ∧ Rlt x (Rdefinitions.IZR (floor x + 1%Z)).
Axiom Ceil_up : forall  (x : R), Rlt (Rdefinitions.IZR (ceil x - 1%Z)) x ∧ Rle x (Rdefinitions.IZR (ceil x)).
Axiom Floor_monotonic : forall  (x : R) (y : R) (fact0 : Rle x y), floor x ≤ floor y.
Axiom Ceil_monotonic : forall  (x : R) (y : R) (fact0 : Rle x y), ceil x ≤ ceil y.
