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
Theorem a_similar_min_max'vc (a : list Z) (fact0 : 1%Z ≤ Z.of_nat (length a)) : let o1 : Z := Z.of_nat (length a) in (0%Z ≤ 0%Z ∧ 0%Z < o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ (∀(x : Z) (y : Z), is_min x a 0%Z o1 ∧ is_max y a 0%Z o1 -> is_min x a 0%Z (Z.of_nat (length a)) ∧ is_max y a 0%Z (Z.of_nat (length a))).
Proof.
Admitted.
