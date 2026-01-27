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
Theorem divide_and_conquer'vc (lo : Z) (hi : Z) (a : list Z) (fact0 : 0%Z ≤ lo) (fact1 : lo < hi) (fact2 : hi ≤ Z.of_nat (length a)) : let o1 : Z := hi - lo in (if decide (o1 = 1%Z) then 0%Z ≤ lo ∧ lo < Z.of_nat (length a) else if decide (hi - lo = 2%Z) then let o2 : Z := lo + 1%Z in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length a)) ∧ (0%Z ≤ lo ∧ lo < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat lo) a inhabitant < nth (Z.to_nat o2) a inhabitant) then let o3 : Z := lo + 1%Z in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a)) ∧ 0%Z ≤ lo ∧ lo < Z.of_nat (length a) else (0%Z ≤ lo ∧ lo < Z.of_nat (length a)) ∧ (let o3 : Z := lo + 1%Z in 0%Z ≤ o3 ∧ o3 < Z.of_nat (length a))) else ¬ 2%Z = 0%Z ∧ (let mid : Z := lo + Z.rem (hi - lo) 2%Z in ((0%Z ≤ hi - lo ∧ mid - lo < hi - lo) ∧ 0%Z ≤ lo ∧ lo < mid ∧ mid ≤ Z.of_nat (length a)) ∧ (∀(x1 : Z) (y1 : Z), is_min x1 a lo mid ∧ is_max y1 a lo mid -> (0%Z ≤ hi - lo ∧ hi - mid < hi - lo) ∧ 0%Z ≤ mid ∧ mid < hi ∧ hi ≤ Z.of_nat (length a)))) ∧ (∀(x : Z) (y : Z), (if decide (o1 = 1%Z) then x = nth (Z.to_nat lo) a inhabitant ∧ y = nth (Z.to_nat lo) a inhabitant else if decide (hi - lo = 2%Z) then if decide (nth (Z.to_nat lo) a inhabitant < nth (Z.to_nat (lo + 1%Z)) a inhabitant) then x = nth (Z.to_nat lo) a inhabitant ∧ y = nth (Z.to_nat (lo + 1%Z)) a inhabitant else x = nth (Z.to_nat (lo + 1%Z)) a inhabitant ∧ y = nth (Z.to_nat lo) a inhabitant else let mid : Z := lo + Z.rem (hi - lo) 2%Z in ∃(x1 : Z) (y1 : Z), (is_min x1 a lo mid ∧ is_max y1 a lo mid) ∧ (∃(x2 : Z) (y2 : Z), (is_min x2 a mid hi ∧ is_max y2 a mid hi) ∧ (if decide (y2 < y1) then y = y1 else y = y2) ∧ (if decide (x1 < x2) then x = x1 else x = x2))) -> is_min x a lo hi ∧ is_max y a lo hi).
Admitted.
