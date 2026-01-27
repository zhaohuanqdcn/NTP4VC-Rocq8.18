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
Axiom fc : Z -> Z.
Axiom fc1 : Z -> Z.
Axiom fc2 : Z -> Z.
Axiom fc'def : forall  (x'x : Z), fc x'x = (if decide (x'x = 0%Z) then 1%Z else if decide (x'x = 1%Z) then 42%Z else 42%Z).
Axiom fc'def1 : forall  (x'x : Z), fc1 x'x = (if decide (x'x = 0%Z) then 1%Z else if decide (x'x = 1%Z) then 42%Z else 42%Z).
Axiom fc'def2 : forall  (x'x : Z), fc2 x'x = (if decide (x'x = 1%Z) then 2%Z else if decide (x'x = 9%Z) then 42%Z else 42%Z).
Theorem g2 (x : Z) (y : Z) (fact0 : 1%Z < x) (fact1 : 1%Z < y) : fc1 x = fc2 y.
Admitted.
