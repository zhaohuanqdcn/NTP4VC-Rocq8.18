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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom dummy : elt.
Theorem minimum'vc (a : list Z) (fact0 : 0%Z < Z.of_nat (length a)) : let o1 : Z := Z.of_nat (length a) - 1%Z in (1%Z ≤ o1 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 1%Z -> nth 0%nat a inhabitant ≤ nth (Z.to_nat j) a inhabitant)) ∧ (∀(m : Z), (∀(i : Z), (1%Z ≤ i ∧ i ≤ o1) ∧ (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat m) a inhabitant ≤ nth (Z.to_nat j) a inhabitant) -> (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (if decide (nth (Z.to_nat i) a inhabitant < nth (Z.to_nat m) a inhabitant) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant) else (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat m) a inhabitant ≤ nth (Z.to_nat j) a inhabitant))) ∧ ((0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> nth (Z.to_nat m) a inhabitant ≤ nth (Z.to_nat j) a inhabitant) -> (0%Z ≤ m ∧ m < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth (Z.to_nat m) a inhabitant ≤ nth (Z.to_nat i) a inhabitant)))) ∧ (o1 + 1%Z < 1%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> nth 0%nat a inhabitant ≤ nth (Z.to_nat i) a inhabitant)).
Proof.
Admitted.
