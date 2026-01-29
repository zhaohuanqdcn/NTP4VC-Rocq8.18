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
Require Import Why3.array.IntArraySorted.
Open Scope Z_scope.
Theorem insertion_sort'vc (a : list Z) : let o1 : Z := Z.of_nat (length a) - 1%Z in (1%Z ≤ o1 + 1%Z -> (sorted_sub1 a 0%Z 1%Z ∧ a ≡ₚ a) ∧ (∀(a1 : list Z), length a1 = length a -> (∀(i : Z), (1%Z ≤ i ∧ i ≤ o1) ∧ sorted_sub1 a1 0%Z i ∧ a ≡ₚ a1 -> (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (let v : Z := nth (Z.to_nat i) a1 inhabitant in ((0%Z ≤ i ∧ i ≤ i) ∧ a ≡ₚ set_list a1 (Z.to_nat i) v ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ k2 ∧ k2 ≤ i -> ¬ k1 = i -> ¬ k2 = i -> nth (Z.to_nat k1) a1 inhabitant ≤ nth (Z.to_nat k2) a1 inhabitant) ∧ (∀(k : Z), i + 1%Z ≤ k ∧ k ≤ i -> v < nth (Z.to_nat k) a1 inhabitant)) ∧ (∀(j : Z) (a2 : list Z), length a2 = length a1 -> (0%Z ≤ j ∧ j ≤ i) ∧ a ≡ₚ set_list a2 (Z.to_nat j) v ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ k2 ∧ k2 ≤ i -> ¬ k1 = j -> ¬ k2 = j -> nth (Z.to_nat k1) a2 inhabitant ≤ nth (Z.to_nat k2) a2 inhabitant) ∧ (∀(k : Z), j + 1%Z ≤ k ∧ k ≤ i -> v < nth (Z.to_nat k) a2 inhabitant) -> (0%Z < j -> (let o2 : Z := j - 1%Z in 0%Z ≤ o2 ∧ o2 < Z.of_nat (length a2))) ∧ (∀(o2 : bool), (if decide (0%Z < j) then o2 = (if decide (v < nth (Z.to_nat (j - 1%Z)) a2 inhabitant) then true else false) else o2 = false) -> (if decide (o2 = true) then let o3 : Z := j - 1%Z in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a2)) ∧ (let o4 : Z := nth (Z.to_nat o3) a2 inhabitant in (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat j) o4) = length a2 -> nth_i (set_list a2 (Z.to_nat j) o4) = fun_updt (nth_i a2) j o4 -> (0%Z ≤ j ∧ j - 1%Z < j) ∧ (0%Z ≤ j - 1%Z ∧ j - 1%Z ≤ i) ∧ a ≡ₚ set_list (set_list a2 (Z.to_nat j) o4) (Z.to_nat (j - 1%Z)) v ∧ (∀(k1 : Z) (k2 : Z), 0%Z ≤ k1 ∧ k1 ≤ k2 ∧ k2 ≤ i -> ¬ k1 = j - 1%Z -> ¬ k2 = j - 1%Z -> nth (Z.to_nat k1) (set_list a2 (Z.to_nat j) o4) inhabitant ≤ nth (Z.to_nat k2) (set_list a2 (Z.to_nat j) o4) inhabitant) ∧ (∀(k : Z), j - 1%Z + 1%Z ≤ k ∧ k ≤ i -> v < nth (Z.to_nat k) (set_list a2 (Z.to_nat j) o4) inhabitant))) else (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat j) v) = length a2 -> nth_i (set_list a2 (Z.to_nat j) v) = fun_updt (nth_i a2) j v -> sorted_sub1 (set_list a2 (Z.to_nat j) v) 0%Z (i + 1%Z) ∧ a ≡ₚ set_list a2 (Z.to_nat j) v)))))) ∧ (sorted_sub1 a1 0%Z (o1 + 1%Z) ∧ a ≡ₚ a1 -> sorted a1 ∧ a ≡ₚ a1))) ∧ (o1 + 1%Z < 1%Z -> sorted a ∧ a ≡ₚ a).
Proof.
Admitted.
