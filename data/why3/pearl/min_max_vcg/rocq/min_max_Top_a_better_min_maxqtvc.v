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
Open Scope Z_scope.
Definition is_min (m : Z) (a : list Z) (lo : Z) (hi : Z) := (∃(i : Z), (lo ≤ i ∧ i < hi ∧ hi ≤ Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = m) ∧ (∀(i : Z), lo ≤ i ∧ i < hi -> m ≤ nth (Z.to_nat i) a inhabitant).
Definition is_max (m : Z) (a : list Z) (lo : Z) (hi : Z) := (∃(i : Z), (lo ≤ i ∧ i < hi ∧ hi ≤ Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = m) ∧ (∀(i : Z), lo ≤ i ∧ i < hi -> nth (Z.to_nat i) a inhabitant ≤ m).
Theorem a_better_min_max'vc (a : list Z) (fact0 : 1%Z ≤ Z.of_nat (length a)) : let n : Z := Z.of_nat (length a) in (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (let o1 : Z := nth 0%nat a inhabitant in (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (let o2 : Z := nth 0%nat a inhabitant in ¬ 2%Z = 0%Z ∧ (∀(o3 : Z), (if decide (Z.quot n 2%Z = 0%Z) then o3 = 2%Z else o3 = 1%Z) -> (o3 = 2%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length a)) ∧ (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ 0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length a)) ∧ (∀(min : Z) (max : Z), (if decide (o3 = 2%Z) then if decide (nth 0%nat a inhabitant < nth 1%nat a inhabitant) then max = nth 1%nat a inhabitant ∧ min = o1 else min = nth 1%nat a inhabitant ∧ max = o2 else min = o1 ∧ max = o2) -> (Z.quot o3 2%Z = Z.quot n 2%Z ∧ is_min min a 0%Z o3 ∧ is_max max a 0%Z o3) ∧ (∀(min1 : Z) (max1 : Z) (i : Z), Z.quot i 2%Z = Z.quot n 2%Z ∧ is_min min1 a 0%Z i ∧ is_max max1 a 0%Z i -> (if decide (i < n) then (let o4 : Z := i + 1%Z in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat i) a inhabitant < nth (Z.to_nat o4) a inhabitant) then let o5 : Z := i + 1%Z in (0%Z ≤ o5 ∧ o5 < Z.of_nat (length a)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length a) else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let o5 : Z := i + 1%Z in 0%Z ≤ o5 ∧ o5 < Z.of_nat (length a)))) ∧ (∀(x : Z) (y : Z), (if decide (nth (Z.to_nat i) a inhabitant < nth (Z.to_nat (i + 1%Z)) a inhabitant) then x = nth (Z.to_nat i) a inhabitant ∧ y = nth (Z.to_nat (i + 1%Z)) a inhabitant else x = nth (Z.to_nat (i + 1%Z)) a inhabitant ∧ y = nth (Z.to_nat i) a inhabitant) -> (∀(min2 : Z), (if decide (x < min1) then min2 = x else min2 = min1) -> (∀(max2 : Z), (if decide (max1 < y) then max2 = y else max2 = max1) -> (0%Z ≤ n - i ∧ n - (i + 2%Z) < n - i) ∧ Z.quot (i + 2%Z) 2%Z = Z.quot n 2%Z ∧ is_min min2 a 0%Z (i + 2%Z) ∧ is_max max2 a 0%Z (i + 2%Z)))) else is_min min1 a 0%Z (Z.of_nat (length a)) ∧ is_max max1 a 0%Z (Z.of_nat (length a)))))))).
Proof.
Admitted.
