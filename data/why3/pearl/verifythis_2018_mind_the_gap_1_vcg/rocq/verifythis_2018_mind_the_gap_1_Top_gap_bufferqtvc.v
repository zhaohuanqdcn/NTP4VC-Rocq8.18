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
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom any_char : char.
Theorem gap_buffer'vc : 0%Z ≤ 0%Z ∧ (∀(o1 : list char), (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) o1 inhabitant = any_char) ∧ Z.of_nat (length o1) = 0%Z -> (let content : list char := ([] : list char) in (0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length o1)) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length o1) -> Z.of_nat (length o1) = Z.of_nat (length content) + 0%Z - 0%Z ∧ (Z.of_nat (length o1) = Z.of_nat (length content) + 0%Z - 0%Z -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) content inhabitant = nth_i o1 i) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) content inhabitant = nth_i o1 i) -> (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length content) -> nth (Z.to_nat i) content inhabitant = nth_i o1 (i + 0%Z - 0%Z))))))).
Proof.
Admitted.
