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
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.SuffixSort.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.SuffixArray.
Open Scope Z_scope.
Theorem lrs'vc (a : list Z) (sa : suffixArray) (fact0 : 0%Z < Z.of_nat (length a)) (fact1 : values sa = a) : let o1 : Z := Z.of_nat (length a) - 1%Z in (1%Z ≤ o1 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ Z.of_nat (length a) ∧ Z.of_nat (length a) ≤ Z.of_nat (length a)) ∧ ¬ 0%Z = Z.of_nat (length a) ∧ is_longest_common_prefix a 0%Z (Z.of_nat (length a)) 0%Z) ∧ (∀(j : Z) (k : Z) (l : Z), (0%Z ≤ j ∧ j < k ∧ k < 1%Z) ∧ is_longest_common_prefix a (nth (Z.to_nat j) (suffixes sa) inhabitant) (nth (Z.to_nat k) (suffixes sa) inhabitant) l -> l ≤ 0%Z)) ∧ (∀(solStart2 : Z) (solLength : Z) (solStart : Z), (∀(i : Z), (1%Z ≤ i ∧ i ≤ o1) ∧ (0%Z ≤ solLength ∧ solLength ≤ Z.of_nat (length a)) ∧ (0%Z ≤ solStart ∧ solStart ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ solStart2 ∧ solStart2 ≤ Z.of_nat (length a)) ∧ ¬ solStart = solStart2 ∧ is_longest_common_prefix a solStart solStart2 solLength) ∧ (∀(j : Z) (k : Z) (l : Z), (0%Z ≤ j ∧ j < k ∧ k < i) ∧ is_longest_common_prefix a (nth (Z.to_nat j) (suffixes sa) inhabitant) (nth (Z.to_nat k) (suffixes sa) inhabitant) l -> l ≤ solLength) -> (0%Z < i ∧ i < Z.of_nat (length (values sa))) ∧ (∀(l : Z), is_longest_common_prefix (values sa) (nth (Z.to_nat (i - 1%Z)) (suffixes sa) inhabitant) (nth (Z.to_nat i) (suffixes sa) inhabitant) l -> (if decide (solLength < l) then (0%Z ≤ i ∧ i < Z.of_nat (length (values sa))) ∧ (let o2 : Z := i - 1%Z in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length (values sa))) ∧ (0%Z ≤ l ∧ l ≤ Z.of_nat (length a)) ∧ (0%Z ≤ nth (Z.to_nat i) (suffixes sa) inhabitant ∧ nth (Z.to_nat i) (suffixes sa) inhabitant ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ nth (Z.to_nat o2) (suffixes sa) inhabitant ∧ nth (Z.to_nat o2) (suffixes sa) inhabitant ≤ Z.of_nat (length a)) ∧ ¬ nth (Z.to_nat i) (suffixes sa) inhabitant = nth (Z.to_nat o2) (suffixes sa) inhabitant ∧ is_longest_common_prefix a (nth (Z.to_nat i) (suffixes sa) inhabitant) (nth (Z.to_nat o2) (suffixes sa) inhabitant) l) ∧ (∀(j : Z) (k : Z) (l1 : Z), (0%Z ≤ j ∧ j < k ∧ k < i + 1%Z) ∧ is_longest_common_prefix a (nth (Z.to_nat j) (suffixes sa) inhabitant) (nth (Z.to_nat k) (suffixes sa) inhabitant) l1 -> l1 ≤ l)) else (0%Z ≤ solLength ∧ solLength ≤ Z.of_nat (length a)) ∧ (0%Z ≤ solStart ∧ solStart ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ solStart2 ∧ solStart2 ≤ Z.of_nat (length a)) ∧ ¬ solStart = solStart2 ∧ is_longest_common_prefix a solStart solStart2 solLength) ∧ (∀(j : Z) (k : Z) (l1 : Z), (0%Z ≤ j ∧ j < k ∧ k < i + 1%Z) ∧ is_longest_common_prefix a (nth (Z.to_nat j) (suffixes sa) inhabitant) (nth (Z.to_nat k) (suffixes sa) inhabitant) l1 -> l1 ≤ solLength)))) ∧ ((0%Z ≤ solLength ∧ solLength ≤ Z.of_nat (length a)) ∧ (0%Z ≤ solStart ∧ solStart ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ solStart2 ∧ solStart2 ≤ Z.of_nat (length a)) ∧ ¬ solStart = solStart2 ∧ is_longest_common_prefix a solStart solStart2 solLength) ∧ (∀(j : Z) (k : Z) (l : Z), (0%Z ≤ j ∧ j < k ∧ k < o1 + 1%Z) ∧ is_longest_common_prefix a (nth (Z.to_nat j) (suffixes sa) inhabitant) (nth (Z.to_nat k) (suffixes sa) inhabitant) l -> l ≤ solLength) -> (0%Z ≤ solLength ∧ solLength ≤ Z.of_nat (length a)) ∧ (0%Z ≤ solStart ∧ solStart ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ solStart2 ∧ solStart2 ≤ Z.of_nat (length a)) ∧ ¬ solStart = solStart2 ∧ is_longest_common_prefix a solStart solStart2 solLength) ∧ (∀(x : Z) (y : Z) (l : Z), (0%Z ≤ x ∧ x < y ∧ y < Z.of_nat (length a)) ∧ is_longest_common_prefix a x y l -> l ≤ solLength)))) ∧ (o1 + 1%Z < 1%Z -> (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ ((0%Z ≤ Z.of_nat (length a) ∧ Z.of_nat (length a) ≤ Z.of_nat (length a)) ∧ ¬ 0%Z = Z.of_nat (length a) ∧ is_longest_common_prefix a 0%Z (Z.of_nat (length a)) 0%Z) ∧ (∀(x : Z) (y : Z) (l : Z), (0%Z ≤ x ∧ x < y ∧ y < Z.of_nat (length a)) ∧ is_longest_common_prefix a x y l -> l ≤ 0%Z)).
Proof.
Admitted.
