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
Axiom char_string : Type.
Axiom char_string_inhabited : Inhabited char_string.
Global Existing Instance char_string_inhabited.
Axiom char_string_countable : Countable char_string.
Global Existing Instance char_string_countable.
Theorem leftpad'vc (n : Z) (s : list char) (pad : char) : let len : Z := Z.max n (Z.of_nat (length s)) in 0%Z ≤ len ∧ (∀(res : list char), (∀(i : Z), 0%Z ≤ i ∧ i < len -> nth (Z.to_nat i) res inhabitant = pad) ∧ Z.of_nat (length res) = len -> (let o1 : Z := Z.of_nat (length s) in let o2 : Z := len - Z.of_nat (length s) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ 0%Z + o1 ≤ Z.of_nat (length s)) ∧ 0%Z ≤ o2 ∧ o2 + o1 ≤ Z.of_nat (length res)) ∧ (∀(res1 : list char), length res1 = length res -> (∀(i : Z), 0%Z ≤ i ∧ i < o2 ∨ o2 + o1 ≤ i ∧ i < Z.of_nat (length res1) -> nth (Z.to_nat i) res1 inhabitant = nth (Z.to_nat i) res inhabitant) ∧ (∀(i : Z), o2 ≤ i ∧ i < o2 + o1 -> nth (Z.to_nat i) res1 inhabitant = nth (Z.to_nat (0%Z + i - o2)) s inhabitant) -> Z.of_nat (length res1) = Z.max n (Z.of_nat (length s)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length res1) - Z.of_nat (length s) -> nth (Z.to_nat i) res1 inhabitant = pad) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> nth (Z.to_nat (Z.of_nat (length res1) - 1%Z - i)) res1 inhabitant = nth (Z.to_nat (Z.of_nat (length s) - 1%Z - i)) s inhabitant)))).
Admitted.
