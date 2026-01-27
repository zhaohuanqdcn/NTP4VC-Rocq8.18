From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom string' : Type.
Axiom string'_inhabited : Inhabited string'.
Global Existing Instance string'_inhabited.
Axiom string'_countable : Countable string'.
Global Existing Instance string'_countable.
Theorem concat'vc (ss : list (list char)) (sep : char) (fact0 : 1%Z ≤ Z.of_nat (length ss)) (fact1 : ¬ Z.of_nat (length ss) = 1%Z) : let o1 : list char := nth (Z.to_nat (Z.of_nat (length ss) - 1%Z)) ss inhabitant in let o2 : list char := cons sep o1 in Z.of_nat (length o2) = 1%Z + Z.of_nat (length o1) ∧ nth 0%nat o2 inhabitant = sep ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o1) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat (i - 1%Z)) o1 inhabitant) -> (let o3 : Z := Z.of_nat (length ss) - 1%Z in (0%Z ≤ 0%Z ∧ 0%Z ≤ o3 ∧ o3 ≤ Z.of_nat (length ss)) ∧ (let o4 : list (list char) := drop 0%nat (take (Z.to_nat o3 - 0%nat) ss) in Z.of_nat (length o4) = o3 - 0%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < o3 - 0%Z -> nth (Z.to_nat k) o4 inhabitant = nth (Z.to_nat (0%Z + k)) ss inhabitant) -> (0%Z ≤ Z.of_nat (length ss) ∧ Z.of_nat (length o4) < Z.of_nat (length ss)) ∧ 1%Z ≤ Z.of_nat (length o4))).
Admitted.
