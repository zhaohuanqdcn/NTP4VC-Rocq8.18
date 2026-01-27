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
Open Scope Z_scope.
Definition is_min (m : Z) (a : list Z) (lo : Z) (hi : Z) := (∃(i : Z), (lo ≤ i ∧ i < hi ∧ hi ≤ Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = m) ∧ (∀(i : Z), lo ≤ i ∧ i < hi -> m ≤ nth (Z.to_nat i) a inhabitant).
Definition is_max (m : Z) (a : list Z) (lo : Z) (hi : Z) := (∃(i : Z), (lo ≤ i ∧ i < hi ∧ hi ≤ Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = m) ∧ (∀(i : Z), lo ≤ i ∧ i < hi -> nth (Z.to_nat i) a inhabitant ≤ m).
Theorem min_max'vc (a : list Z) (fact0 : 1%Z ≤ Z.of_nat (length a)) : 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a) ∧ (let o1 : Z := nth 0%nat a inhabitant in (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (let o2 : Z := nth 0%nat a inhabitant in let o3 : Z := Z.of_nat (length a) - 1%Z in (1%Z ≤ o3 + 1%Z -> (is_min o1 a 0%Z 1%Z ∧ is_max o2 a 0%Z 1%Z) ∧ (∀(max : Z) (min : Z), (∀(i : Z), (1%Z ≤ i ∧ i ≤ o3) ∧ is_min min a 0%Z i ∧ is_max max a 0%Z i -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat i) a inhabitant < min) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (max < nth (Z.to_nat i) a inhabitant) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ is_min (nth (Z.to_nat i) a inhabitant) a 0%Z (i + 1%Z) ∧ is_max (nth (Z.to_nat i) a inhabitant) a 0%Z (i + 1%Z) else is_min (nth (Z.to_nat i) a inhabitant) a 0%Z (i + 1%Z) ∧ is_max max a 0%Z (i + 1%Z)) else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (max < nth (Z.to_nat i) a inhabitant) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ is_min min a 0%Z (i + 1%Z) ∧ is_max (nth (Z.to_nat i) a inhabitant) a 0%Z (i + 1%Z) else is_min min a 0%Z (i + 1%Z) ∧ is_max max a 0%Z (i + 1%Z)))) ∧ (is_min min a 0%Z (o3 + 1%Z) ∧ is_max max a 0%Z (o3 + 1%Z) -> is_min min a 0%Z (Z.of_nat (length a)) ∧ is_max max a 0%Z (Z.of_nat (length a))))) ∧ (o3 + 1%Z < 1%Z -> is_min o1 a 0%Z (Z.of_nat (length a)) ∧ is_max o2 a 0%Z (Z.of_nat (length a))))).
Admitted.
