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
Definition is_duplet (a : list Z) (i : Z) (j : Z) := (0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant.
Definition eq_opt (x : Z) (o1 : option Z) := match o1 with | None => False | Some v => v = x end.
Theorem duplet'vc (a : list Z) (except : option Z) (fact0 : 2%Z ≤ Z.of_nat (length a)) (fact1 : ∃(i : Z) (j : Z), is_duplet a i j ∧ ¬ eq_opt (nth (Z.to_nat i) a inhabitant) except) : let o1 : Z := Z.of_nat (length a) - 2%Z in (0%Z ≤ o1 + 1%Z -> (∀(k : Z) (l : Z), (0%Z ≤ k ∧ k < 0%Z) ∧ k < l ∧ l < Z.of_nat (length a) -> ¬ eq_opt (nth (Z.to_nat k) a inhabitant) except -> ¬ is_duplet a k l) ∧ (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(k : Z) (l : Z), (0%Z ≤ k ∧ k < i) ∧ k < l ∧ l < Z.of_nat (length a) -> ¬ eq_opt (nth (Z.to_nat k) a inhabitant) except -> ¬ is_duplet a k l) -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let v : Z := nth (Z.to_nat i) a inhabitant in if decide (eq_opt v except) then ∀(k : Z) (l : Z), (0%Z ≤ k ∧ k < i + 1%Z) ∧ k < l ∧ l < Z.of_nat (length a) -> ¬ eq_opt (nth (Z.to_nat k) a inhabitant) except -> ¬ is_duplet a k l else let o2 : Z := Z.of_nat (length a) - 1%Z in let o3 : Z := i + 1%Z in (o3 ≤ o2 + 1%Z -> (∀(l : Z), i < l ∧ l < o3 -> ¬ is_duplet a i l) ∧ (∀(j : Z), (o3 ≤ j ∧ j ≤ o2) ∧ (∀(l : Z), i < l ∧ l < j -> ¬ is_duplet a i l) -> (0%Z ≤ j ∧ j < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat j) a inhabitant = v) then is_duplet a i j ∧ ¬ eq_opt (nth (Z.to_nat i) a inhabitant) except else ∀(l : Z), i < l ∧ l < j + 1%Z -> ¬ is_duplet a i l)) ∧ ((∀(l : Z), i < l ∧ l < o2 + 1%Z -> ¬ is_duplet a i l) -> (∀(k : Z) (l : Z), (0%Z ≤ k ∧ k < i + 1%Z) ∧ k < l ∧ l < Z.of_nat (length a) -> ¬ eq_opt (nth (Z.to_nat k) a inhabitant) except -> ¬ is_duplet a k l))) ∧ (o2 + 1%Z < o3 -> (∀(k : Z) (l : Z), (0%Z ≤ k ∧ k < i + 1%Z) ∧ k < l ∧ l < Z.of_nat (length a) -> ¬ eq_opt (nth (Z.to_nat k) a inhabitant) except -> ¬ is_duplet a k l)))) ∧ ¬ (∀(k : Z) (l : Z), (0%Z ≤ k ∧ k < o1 + 1%Z) ∧ k < l ∧ l < Z.of_nat (length a) -> ¬ eq_opt (nth (Z.to_nat k) a inhabitant) except -> ¬ is_duplet a k l)) ∧ ¬ o1 + 1%Z < 0%Z.
Admitted.
