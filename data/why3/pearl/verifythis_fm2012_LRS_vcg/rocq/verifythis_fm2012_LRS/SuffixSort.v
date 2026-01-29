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
Definition sorted_sub (a : list Z) (data : Z -> Z) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u -> le a (data i1) (data i2).
Definition sorted (a : list Z) (data : list Z) := sorted_sub a (nth_i data) 0%Z (Z.of_nat (length data)).
