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
Theorem most_frequent'vc (a : list Z) (fact0 : 0%Z < Z.of_nat (length a)) (fact1 : ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant) : 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a) ∧ (let o1 : Z := nth 0%nat a inhabitant in let o2 : Z := Z.of_nat (length a) - 1%Z in (1%Z ≤ o2 + 1%Z -> (1%Z = Z.of_nat (count_occ' (drop 0%nat (take (1%nat - 0%nat) a)) (nth (Z.to_nat (1%Z - 1%Z)) a inhabitant)) ∧ 1%Z = Z.of_nat (count_occ' (drop 0%nat (take (1%nat - 0%nat) a)) o1) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (1%nat - 0%nat) a)) x) ≤ 1%Z)) ∧ (∀(m : Z) (c : Z) (r : Z), (∀(i : Z), (1%Z ≤ i ∧ i ≤ o2) ∧ c = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) (nth (Z.to_nat (i - 1%Z)) a inhabitant)) ∧ m = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) r) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat i - 0%nat) a)) x) ≤ m) -> (let o3 : Z := i - 1%Z in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat i) a inhabitant = nth (Z.to_nat o3) a inhabitant) then if decide (m < c + 1%Z) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ c + 1%Z = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) (nth (Z.to_nat (i + 1%Z - 1%Z)) a inhabitant)) ∧ c + 1%Z = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) (nth (Z.to_nat i) a inhabitant)) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) x) ≤ c + 1%Z) else c + 1%Z = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) (nth (Z.to_nat (i + 1%Z - 1%Z)) a inhabitant)) ∧ m = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) r) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) x) ≤ m) else 1%Z = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) (nth (Z.to_nat (i + 1%Z - 1%Z)) a inhabitant)) ∧ m = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) r) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (i + 1%Z) - 0%nat) a)) x) ≤ m)))) ∧ (c = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o2 + 1%Z) - 0%nat) a)) (nth (Z.to_nat (o2 + 1%Z - 1%Z)) a inhabitant)) ∧ m = Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o2 + 1%Z) - 0%nat) a)) r) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (Z.to_nat (o2 + 1%Z) - 0%nat) a)) x) ≤ m) -> 0%Z < Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) r) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) x) ≤ Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) r))))) ∧ (o2 + 1%Z < 1%Z -> 0%Z < Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) o1) ∧ (∀(x : Z), Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) x) ≤ Z.of_nat (count_occ' (drop 0%nat (take (length a - 0%nat) a)) o1)))).
Proof.
Admitted.
