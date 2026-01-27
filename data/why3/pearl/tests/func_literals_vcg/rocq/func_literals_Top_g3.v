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
Axiom fc'def : forall  (x'x : Z), fc x'x = (if decide (x'x = 0%Z) then 1%Z else if decide (x'x = 1%Z) then 2%Z else 2%Z).
Axiom fc'def1 : forall  (x'x : Z), fc1 x'x = (if decide (x'x = 0%Z) then 1%Z else if decide (x'x = 1%Z) then - 2%Z else - 2%Z).
Theorem g3 : let a : Z -> Z := fc in let b : Z -> Z := fc1 in a 0%Z = b 0%Z ∧ a 1%Z = - b 1%Z ∧ a 2%Z = - b 3%Z ∧ a 3%Z = - b 3%Z ∧ ¬ a 3%Z = b 3%Z.
Admitted.
