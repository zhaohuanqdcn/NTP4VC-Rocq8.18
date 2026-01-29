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
Definition inv (a : list Z) := nth 0%nat a inhabitant = 0%Z ∧ Z.of_nat (length a) = 11%Z ∧ (∀(k : Z), 1%Z ≤ k ∧ k ≤ 10%Z -> 0%Z < nth (Z.to_nat k) a inhabitant).
Theorem insertion_sort'vc (a : list Z) (fact0 : inv a) : 2%Z ≤ 2%Z ∧ 2%Z ≤ 11%Z ∧ inv a ∧ 0%Z = 2%Z - 2%Z ∧ 2%Z * 0%Z ≤ (2%Z - 2%Z) * (2%Z - 1%Z) ∧ (∀(i : Z) (loop2 : Z) (a1 : list Z), length a1 = length a -> (2%Z ≤ i ∧ i ≤ 11%Z) ∧ inv a1 ∧ 2%Z * loop2 ≤ (i - 2%Z) * (i - 1%Z) -> (if decide (i ≤ 10%Z) then ((1%Z ≤ i ∧ i ≤ i) ∧ inv a1 ∧ 2%Z * loop2 ≤ (i - 2%Z) * (i - 1%Z) + 2%Z * (i - i)) ∧ (∀(j : Z) (loop21 : Z) (a2 : list Z), length a2 = length a1 -> (1%Z ≤ j ∧ j ≤ i) ∧ inv a2 ∧ 2%Z * loop21 ≤ (i - 2%Z) * (i - 1%Z) + 2%Z * (i - j) -> (let o1 : Z := j - 1%Z in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length a2)) ∧ (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (if decide (nth (Z.to_nat j) a2 inhabitant < nth (Z.to_nat o1) a2 inhabitant) then (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (let temp : Z := nth (Z.to_nat j) a2 inhabitant in let o2 : Z := j - 1%Z in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length a2)) ∧ (let o3 : Z := nth (Z.to_nat o2) a2 inhabitant in (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat j) o3) = length a2 -> nth_i (set_list a2 (Z.to_nat j) o3) = fun_updt (nth_i a2) j o3 -> (let o4 : Z := j - 1%Z in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length (set_list a2 (Z.to_nat j) o3))) ∧ (length (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat o4) temp) = length (set_list a2 (Z.to_nat j) o3) -> nth_i (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat o4) temp) = fun_updt (nth_i (set_list a2 (Z.to_nat j) o3)) o4 temp -> (0%Z ≤ j ∧ j - 1%Z < j) ∧ (1%Z ≤ j - 1%Z ∧ j - 1%Z ≤ i) ∧ inv (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat o4) temp) ∧ 2%Z * (loop21 + 1%Z) ≤ (i - 2%Z) * (i - 1%Z) + 2%Z * (i - (j - 1%Z))))))) else (0%Z ≤ 10%Z - i ∧ 10%Z - (i + 1%Z) < 10%Z - i) ∧ (2%Z ≤ i + 1%Z ∧ i + 1%Z ≤ 11%Z) ∧ inv a2 ∧ i - 2%Z + 1%Z = i + 1%Z - 2%Z ∧ 2%Z * loop21 ≤ (i + 1%Z - 2%Z) * (i + 1%Z - 1%Z)))) else i - 2%Z = 9%Z ∧ loop2 ≤ 45%Z)).
Proof.
Admitted.
