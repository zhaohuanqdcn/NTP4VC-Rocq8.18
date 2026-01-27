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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.map.MapInjection.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.LCP.
Open Scope Z_scope.
Definition lt (a : list Z) (x : Z) (y : Z) := let n : Z := Z.of_nat (length a) in (0%Z ≤ x ∧ x ≤ n) ∧ (0%Z ≤ y ∧ y ≤ n) ∧ (∃(l : Z), is_common_prefix a x y l ∧ y + l < n ∧ (x + l = n ∨ nth (Z.to_nat (x + l)) a inhabitant < nth (Z.to_nat (y + l)) a inhabitant)).
Definition range (a : list Z) := MapInjection.range (nth_i a) (Z.of_nat (length a)).
Definition le (a : list Z) (x : Z) (y : Z) := x = y ∨ lt a x y.
Theorem le_trans'vc (a : list Z) (x : Z) (y : Z) (z : Z) (fact0 : le a x y) (fact1 : le a y z) : le a x z.
Admitted.
