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
Require Import Why3.map.MapInjection.
Open Scope Z_scope.
Definition injective (a : list Z) (n : Z) := MapInjection.injective (nth_i a) n.
Definition surjective (a : list Z) (n : Z) := MapInjection.surjective (nth_i a) n.
Definition range (a : list Z) (n : Z) := MapInjection.range (nth_i a) n.
Theorem inverting'vc (a : list Z) (b : list Z) (fact0 : length a = length b) (fact1 : injective a (Z.of_nat (length a))) (fact2 : range a (Z.of_nat (length a))) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat (nth (Z.to_nat j) a inhabitant)) b inhabitant = j) ∧ (∀(b1 : list Z), length b1 = length b -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat (nth (Z.to_nat j) a inhabitant)) b1 inhabitant = j) -> (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (let o2 : Z := nth (Z.to_nat i) a inhabitant in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length b1)) ∧ (length (set_list b1 (Z.to_nat o2) i) = length b1 -> nth_i (set_list b1 (Z.to_nat o2) i) = fun_updt (nth_i b1) o2 i -> (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat (nth (Z.to_nat j) a inhabitant)) (set_list b1 (Z.to_nat o2) i) inhabitant = j)))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> nth (Z.to_nat (nth (Z.to_nat j) a inhabitant)) b1 inhabitant = j) -> injective b1 (Z.of_nat (length a))))) ∧ (o1 + 1%Z < 0%Z -> injective b (Z.of_nat (length a))).
Proof.
Admitted.
