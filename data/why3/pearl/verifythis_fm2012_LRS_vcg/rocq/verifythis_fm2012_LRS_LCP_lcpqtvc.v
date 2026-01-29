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
Definition is_common_prefix (a : list Z) (x : Z) (y : Z) (l : Z) := 0%Z ≤ l ∧ x + l ≤ Z.of_nat (length a) ∧ y + l ≤ Z.of_nat (length a) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l -> nth (Z.to_nat (x + i)) a inhabitant = nth (Z.to_nat (y + i)) a inhabitant).
Definition is_longest_common_prefix (a : list Z) (x : Z) (y : Z) (l : Z) := is_common_prefix a x y l ∧ (∀(m : Z), l < m -> ¬ is_common_prefix a x y m).
Theorem lcp'vc (x : Z) (a : list Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : x ≤ Z.of_nat (length a)) (fact2 : 0%Z ≤ y) (fact3 : y ≤ Z.of_nat (length a)) : let n : Z := Z.of_nat (length a) in is_common_prefix a x y 0%Z ∧ (∀(l : Z), is_common_prefix a x y l -> (let o1 : Z := x + l in (o1 < n -> y + l < n -> (let o2 : Z := y + l in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length a)) ∧ (let o3 : Z := x + l in 0%Z ≤ o3 ∧ o3 < Z.of_nat (length a)))) ∧ (∀(o2 : bool), (if decide (o1 < n) then if decide (y + l < n) then o2 = (if decide (nth (Z.to_nat (x + l)) a inhabitant = nth (Z.to_nat (y + l)) a inhabitant) then true else false) else o2 = false else o2 = false) -> (if decide (o2 = true) then (0%Z ≤ n - l ∧ n - (l + 1%Z) < n - l) ∧ is_common_prefix a x y (l + 1%Z) else is_longest_common_prefix a x y l)))).
Proof.
Admitted.
