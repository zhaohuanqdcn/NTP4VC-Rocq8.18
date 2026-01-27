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
Theorem array_of_list'vc {α : Type} `{Inhabited α} (l : list α) (o1 : nat) (n : bv 63%N) (fact0 : ¬ l = ([] : list α)) (fact1 : o1 = length l) (fact2 : bv_signed n = Z.of_nat o1) : match l with | [] => False | cons x ll => 0%Z ≤ bv_signed n ∧ (∀(a : array63 α), (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed n -> nth (Z.to_nat i) (array63_elts a) inhabitant = x) ∧ array63_length a = n -> (∀(a1 : array63 α), array63_length a1 = array63_length a -> (∀(i : bv 63%N) (ll1 : list α), (1%Z ≤ bv_signed i ∧ bv_signed n - bv_signed i = Z.of_nat (length ll1)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed i -> Some (nth (Z.to_nat j) (array63_elts a1) inhabitant) = nth_error_i l j) ∧ (∀(j : Z), bv_signed i ≤ j ∧ j < bv_signed n -> nth_error_i ll1 (j - bv_signed i) = nth_error_i l j) -> (match ll1 with | [] => (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed n -> Some (nth (Z.to_nat j) (array63_elts a1) inhabitant) = nth_error_i l j) | cons x1 ll2 => (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length a1)) ∧ (∀(a2 : array63 α), array63_length a2 = array63_length a1 -> array63_elts a2 = set_list (array63_elts a1) (Z.to_nat (bv_signed i)) x1 -> int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed n - bv_signed i ∧ bv_signed n - bv_signed o2 < bv_signed n - bv_signed i) ∧ (1%Z ≤ bv_signed o2 ∧ bv_signed n - bv_signed o2 = Z.of_nat (length ll2)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed o2 -> Some (nth (Z.to_nat j) (array63_elts a2) inhabitant) = nth_error_i l j) ∧ (∀(j : Z), bv_signed o2 ≤ j ∧ j < bv_signed n -> nth_error_i ll2 (j - bv_signed o2) = nth_error_i l j))) end))) ∧ ((1%Z ≤ 1%Z ∧ bv_signed n - 1%Z = Z.of_nat (length ll)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 1%Z -> Some (nth (Z.to_nat j) (array63_elts a) inhabitant) = nth_error_i l j) ∧ (∀(j : Z), 1%Z ≤ j ∧ j < bv_signed n -> nth_error_i ll (j - 1%Z) = nth_error_i l j)) ∧ (∀(a1 : array63 α), array63_length a1 = array63_length a -> (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed n -> Some (nth (Z.to_nat j) (array63_elts a1) inhabitant) = nth_error_i l j) -> bv_signed (array63_length a1) = Z.of_nat (length l) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length l) -> Some (nth (Z.to_nat i) (array63_elts a1) inhabitant) = nth_error_i l i))) end.
Admitted.
