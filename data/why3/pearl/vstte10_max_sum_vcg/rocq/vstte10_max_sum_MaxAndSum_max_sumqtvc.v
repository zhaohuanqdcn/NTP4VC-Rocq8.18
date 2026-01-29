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
Theorem max_sum'vc (a : list Z) (fact0 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ nth (Z.to_nat i) a inhabitant) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> 0%Z ≤ 0%Z * 0%Z ∧ (∀(max : Z) (sum : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ sum ≤ i * max -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (max < nth (Z.to_nat i) a inhabitant) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ sum + nth (Z.to_nat i) a inhabitant ≤ (i + 1%Z) * nth (Z.to_nat i) a inhabitant else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ sum + nth (Z.to_nat i) a inhabitant ≤ (i + 1%Z) * max)) ∧ (sum ≤ (o1 + 1%Z) * max -> sum ≤ Z.of_nat (length a) * max))) ∧ (o1 + 1%Z < 0%Z -> 0%Z ≤ Z.of_nat (length a) * 0%Z).
Proof.
Admitted.
