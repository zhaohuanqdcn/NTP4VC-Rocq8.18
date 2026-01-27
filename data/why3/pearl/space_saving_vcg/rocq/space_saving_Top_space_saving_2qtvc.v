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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom dummy : elt.
Theorem space_saving_2'vc (s : Z -> elt) : 0%Z + 0%Z = 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (map_occ_list dummy s 0%Z 0%Z) ∧ Z.of_nat (map_occ_list dummy s 0%Z 0%Z) ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (map_occ_list dummy s 0%Z 0%Z) ∧ Z.of_nat (map_occ_list dummy s 0%Z 0%Z) ≤ 0%Z ∧ (0%Z < 0%Z -> ¬ 0%Z < 0%Z) ∧ (∀(y : elt), ¬ y = dummy -> ¬ y = dummy -> Z.of_nat (map_occ_list y s 0%Z 0%Z) ≤ Z.min 0%Z 0%Z) ∧ (∀(n2 : Z) (x2 : elt) (n1 : Z) (x1 : elt), 0%Z ≤ n1 + n2 ∧ (0%Z ≤ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2)) ∧ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2)) ≤ n1) ∧ (0%Z ≤ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2)) ∧ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2)) ≤ n2) ∧ (if decide (n1 = 0%Z) then x1 = dummy else ¬ x1 = dummy) ∧ (if decide (n2 = 0%Z) then x2 = dummy else ¬ x2 = dummy) ∧ (0%Z < n1 -> 0%Z < n2 -> ¬ x1 = x2) ∧ (∀(y : elt), ¬ y = x1 -> ¬ y = x2 -> Z.of_nat (map_occ_list y s 0%Z (n1 + n2)) ≤ Z.min n1 n2) -> 0%Z ≤ n1 + n2 ∧ (¬ s (n1 + n2) = dummy -> (if decide (s (n1 + n2) = x1) then (n1 + 1%Z + n2 = n1 + n2 + 1%Z ∧ 0%Z ≤ n1 + n2 + 1%Z) ∧ (0%Z ≤ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2 + 1%Z)) ≤ n1 + 1%Z) ∧ (0%Z ≤ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2 + 1%Z)) ≤ n2) ∧ (if decide (n1 + 1%Z = 0%Z) then x1 = dummy else ¬ x1 = dummy) ∧ (if decide (n2 = 0%Z) then x2 = dummy else ¬ x2 = dummy) ∧ (0%Z < n1 + 1%Z -> 0%Z < n2 -> ¬ x1 = x2) ∧ (∀(y : elt), ¬ y = x1 -> ¬ y = x2 -> Z.of_nat (map_occ_list y s 0%Z (n1 + n2 + 1%Z)) ≤ Z.min (n1 + 1%Z) n2) else if decide (s (n1 + n2) = x2) then (n1 + (n2 + 1%Z) = n1 + n2 + 1%Z ∧ 0%Z ≤ n1 + n2 + 1%Z) ∧ (0%Z ≤ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2 + 1%Z)) ≤ n1) ∧ (0%Z ≤ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2 + 1%Z)) ≤ n2 + 1%Z) ∧ (if decide (n1 = 0%Z) then x1 = dummy else ¬ x1 = dummy) ∧ (if decide (n2 + 1%Z = 0%Z) then x2 = dummy else ¬ x2 = dummy) ∧ (0%Z < n1 -> 0%Z < n2 + 1%Z -> ¬ x1 = x2) ∧ (∀(y : elt), ¬ y = x1 -> ¬ y = x2 -> Z.of_nat (map_occ_list y s 0%Z (n1 + n2 + 1%Z)) ≤ Z.min n1 (n2 + 1%Z)) else if decide (n1 ≤ n2) then (n1 + 1%Z + n2 = n1 + n2 + 1%Z ∧ 0%Z ≤ n1 + n2 + 1%Z) ∧ (0%Z ≤ Z.of_nat (map_occ_list (s (n1 + n2)) s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list (s (n1 + n2)) s 0%Z (n1 + n2 + 1%Z)) ≤ n1 + 1%Z) ∧ (0%Z ≤ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list x2 s 0%Z (n1 + n2 + 1%Z)) ≤ n2) ∧ (if decide (n1 + 1%Z = 0%Z) then s (n1 + n2) = dummy else ¬ s (n1 + n2) = dummy) ∧ (if decide (n2 = 0%Z) then x2 = dummy else ¬ x2 = dummy) ∧ (0%Z < n1 + 1%Z -> 0%Z < n2 -> ¬ s (n1 + n2) = x2) ∧ (∀(y : elt), ¬ y = s (n1 + n2) -> ¬ y = x2 -> Z.of_nat (map_occ_list y s 0%Z (n1 + n2 + 1%Z)) ≤ Z.min (n1 + 1%Z) n2) else (n1 + (n2 + 1%Z) = n1 + n2 + 1%Z ∧ 0%Z ≤ n1 + n2 + 1%Z) ∧ (0%Z ≤ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list x1 s 0%Z (n1 + n2 + 1%Z)) ≤ n1) ∧ (0%Z ≤ Z.of_nat (map_occ_list (s (n1 + n2)) s 0%Z (n1 + n2 + 1%Z)) ∧ Z.of_nat (map_occ_list (s (n1 + n2)) s 0%Z (n1 + n2 + 1%Z)) ≤ n2 + 1%Z) ∧ (if decide (n1 = 0%Z) then x1 = dummy else ¬ x1 = dummy) ∧ (if decide (n2 + 1%Z = 0%Z) then s (n1 + n2) = dummy else ¬ s (n1 + n2) = dummy) ∧ (0%Z < n1 -> 0%Z < n2 + 1%Z -> ¬ x1 = s (n1 + n2)) ∧ (∀(y : elt), ¬ y = x1 -> ¬ y = s (n1 + n2) -> Z.of_nat (map_occ_list y s 0%Z (n1 + n2 + 1%Z)) ≤ Z.min n1 (n2 + 1%Z))))).
Admitted.
