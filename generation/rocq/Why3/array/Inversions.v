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
Require Import Why3.int.NumOf.
Require Import Why3.int.Sum.
Require Import Why3.map.MapExchange.
Open Scope Z_scope.
Definition inversion (a : list Z) (i : Z) (j : Z) := nth (Z.to_nat j) a inhabitant < nth (Z.to_nat i) a inhabitant.
Axiom inversion_closure : list Z -> Z -> Z -> bool.
Axiom inversion_closure_def : forall  (y : list Z) (y1 : Z) (y2 : Z), (inversion_closure y y1 y2 = true) = inversion y y1 y2.
Definition inversions_for (a : list Z) (i : Z) : Z := numof (inversion_closure a i) i (Z.of_nat (length a)).
Axiom inversions_for_closure : list Z -> Z -> Z.
Axiom inversions_for_closure_def : forall  (y : list Z) (y1 : Z), inversions_for_closure y y1 = inversions_for y y1.
Definition inversions (a : list Z) : Z := sum (inversions_for_closure a) 0%Z (Z.of_nat (length a)).
Axiom exchange_inversion : forall  (i0 : Z) (a1 : list Z) (a2 : list Z) (fact0 : 0%Z ≤ i0) (fact1 : i0 < Z.of_nat (length a1) - 1%Z) (fact2 : nth (Z.to_nat (i0 + 1%Z)) a1 inhabitant < nth (Z.to_nat i0) a1 inhabitant) (fact3 : array_exchange a1 a2 i0 (i0 + 1%Z)), inversions a2 < inversions a1.
