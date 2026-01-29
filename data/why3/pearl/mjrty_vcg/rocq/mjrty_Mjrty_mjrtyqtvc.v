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
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Axiom fc : forall {α : Type} `{Inhabited α}, list α -> α -> Z -> bool.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (a : list α) (v : α) (i : Z), (fc a v i = true) = (nth (Z.to_nat i) a inhabitant = v).
Axiom candidate : Type.
Axiom candidate_inhabited : Inhabited candidate.
Global Existing Instance candidate_inhabited.
Axiom candidate_countable : Countable candidate.
Global Existing Instance candidate_countable.
Theorem mjrty'vc (a : list candidate) (fact0 : 1%Z ≤ Z.of_nat (length a)) : let n : Z := Z.of_nat (length a) in (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (let o1 : candidate := nth 0%nat a inhabitant in let o2 : Z := n - 1%Z in (0%Z ≤ o2 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (count_occ' (drop 0%nat (take (0%nat - 0%nat) a)) o1)) ∧ 2%Z * (Z.of_nat (count_occ' (drop 0%nat (take (0%nat - 0%nat) a)) o1) - 0%Z) ≤ 0%Z - 0%Z ∧ (∀(c : candidate), ¬ c = o1 -> 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (0%nat - 0%nat) a)) c) ≤ 0%Z - 0%Z)) ∧ (∀(k : Z) (cand : candidate), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o2) ∧ (0%Z ≤ k ∧ k ≤ Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) cand)) ∧ 2%Z * (Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) cand) - k) ≤ i - k ∧ (∀(c : candidate), ¬ c = cand -> 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) c) ≤ i - k) -> (if decide (k = 0%Z) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) (nth (Z.to_nat i) a inhabitant))) ∧ 2%Z * (Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) (nth (Z.to_nat i) a inhabitant)) - 1%Z) ≤ i + 1%Z - 1%Z ∧ (∀(c : candidate), ¬ c = nth (Z.to_nat i) a inhabitant -> 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) c) ≤ i + 1%Z - 1%Z) else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (cand = nth (Z.to_nat i) a inhabitant) then (0%Z ≤ k + 1%Z ∧ k + 1%Z ≤ Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) cand)) ∧ 2%Z * (Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) cand) - (k + 1%Z)) ≤ i + 1%Z - (k + 1%Z) ∧ (∀(c : candidate), ¬ c = cand -> 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) c) ≤ i + 1%Z - (k + 1%Z)) else (0%Z ≤ k - 1%Z ∧ k - 1%Z ≤ Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) cand)) ∧ 2%Z * (Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) cand) - (k - 1%Z)) ≤ i + 1%Z - (k - 1%Z) ∧ (∀(c : candidate), ¬ c = cand -> 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) c) ≤ i + 1%Z - (k - 1%Z))))) ∧ ((0%Z ≤ k ∧ k ≤ Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o2 + 1%Z) - 0%nat) a)) cand)) ∧ 2%Z * (Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o2 + 1%Z) - 0%nat) a)) cand) - k) ≤ o2 + 1%Z - k ∧ (∀(c : candidate), ¬ c = cand -> 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o2 + 1%Z) - 0%nat) a)) c) ≤ o2 + 1%Z - k) -> (if decide (k = 0%Z) then ∀(c : candidate), 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) c) ≤ Z.of_nat (length a) else if decide (n < 2%Z * k) then Z.of_nat (length a) < 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) cand) else let o3 : Z := n - 1%Z in (0%Z ≤ o3 + 1%Z -> (0%Z = Z.of_nat (count_occ' (drop 0%nat (take (0%nat - 0%nat) a)) cand) ∧ 2%Z * 0%Z ≤ n) ∧ (∀(k1 : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o3) ∧ k1 = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) cand) ∧ 2%Z * k1 ≤ n -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat i) a inhabitant = cand) then if decide (n < 2%Z * (k1 + 1%Z)) then Z.of_nat (length a) < 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) cand) else k1 + 1%Z = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) cand) ∧ 2%Z * (k1 + 1%Z) ≤ n else k1 = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) cand) ∧ 2%Z * k1 ≤ n)) ∧ (k1 = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o3 + 1%Z) - 0%nat) a)) cand) ∧ 2%Z * k1 ≤ n -> (∀(c : candidate), 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) c) ≤ Z.of_nat (length a))))) ∧ (o3 + 1%Z < 0%Z -> (∀(c : candidate), 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) c) ≤ Z.of_nat (length a))))))) ∧ (o2 + 1%Z < 0%Z -> (∀(c : candidate), 2%Z * Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) c) ≤ Z.of_nat (length a)))).
Proof.
Admitted.
