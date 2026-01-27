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
Axiom exp_limit_fun : R -> unit.
Axiom exp_limit_fun'def : forall  (x : R) (fact0 : Rle (Rabs x) 25%R), exp_limit_fun x = ().
Axiom exp_limit_fun'spec : forall  (x : R) (fact0 : Rle (Rabs x) 25%R), Rle (exp x) 72004899338%R.
Theorem huge_power : Rle (Rpower 5%R 100%R) 7888609100000000000000000000000000000000000000000000000000000000000000%R.
Admitted.
