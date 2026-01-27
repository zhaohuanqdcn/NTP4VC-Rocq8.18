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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom fc : array63 (bv 63%N) -> Z -> Z.
Axiom fc'def : forall  (a : array63 (bv 63%N)) (i : Z), fc a i = bv_signed (nth (Z.to_nat i) (array63_elts a) inhabitant).
Definition sum (a : array63 (bv 63%N)) (lo : Z) (hi : Z) : Z := int.Sum.sum (fc a) lo hi.
Theorem maximum_subarray'vc (a : array63 (bv 63%N)) (fact0 : ∀(l : Z) (h : Z), 0%Z ≤ l ∧ l ≤ h ∧ h ≤ bv_signed (array63_length a) -> sum a l h ≤ bv_signed int'63_max) : let n : bv 63%N := array63_length a in (((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed (0%bv : bv 63%N) ∧ bv_signed (0%bv : bv 63%N) ≤ bv_signed n) ∧ 0%Z ≤ bv_signed (0%bv : bv 63%N) ∧ bv_signed (0%bv : bv 63%N) = sum a 0%Z 0%Z) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ bv_signed (0%bv : bv 63%N) -> sum a l' h' ≤ bv_signed (0%bv : bv 63%N)) ∧ ((0%Z ≤ 0%Z ∧ 0%Z ≤ bv_signed (0%bv : bv 63%N)) ∧ bv_signed (0%bv : bv 63%N) = sum a 0%Z (bv_signed (0%bv : bv 63%N))) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < bv_signed (0%bv : bv 63%N) -> sum a l' (bv_signed (0%bv : bv 63%N)) ≤ bv_signed (0%bv : bv 63%N))) ∧ (∀(i : bv 63%N) (s : bv 63%N) (l : Z) (ms : bv 63%N) (hi : Z) (lo : Z), ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ bv_signed i ∧ bv_signed i ≤ bv_signed n) ∧ 0%Z ≤ bv_signed ms ∧ bv_signed ms = sum a lo hi) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ bv_signed i -> sum a l' h' ≤ bv_signed ms) ∧ ((0%Z ≤ l ∧ l ≤ bv_signed i) ∧ bv_signed s = sum a l (bv_signed i)) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < bv_signed i -> sum a l' (bv_signed i) ≤ bv_signed s) -> (if decide (bv_signed i < bv_signed n) then if decide (bv_signed s < bv_signed (0%bv : bv 63%N)) then (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length a)) ∧ (if decide (bv_signed ms < bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant)) then bv_signed i < 4611686018427387903%Z ∧ (∀(i1 : bv 63%N), bv_signed i1 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed n - bv_signed i ∧ bv_signed n - bv_signed i1 < bv_signed n - bv_signed i) ∧ ((0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed i + 1%Z ∧ bv_signed i + 1%Z ≤ bv_signed i1 ∧ bv_signed i1 ≤ bv_signed n) ∧ 0%Z ≤ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant) ∧ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant) = sum a (bv_signed i) (bv_signed i + 1%Z)) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ bv_signed i1 -> sum a l' h' ≤ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant)) ∧ ((0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed i1) ∧ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant) = sum a (bv_signed i) (bv_signed i1)) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < bv_signed i1 -> sum a l' (bv_signed i1) ≤ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant))) else bv_signed i < 4611686018427387903%Z ∧ (∀(i1 : bv 63%N), bv_signed i1 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed n - bv_signed i ∧ bv_signed n - bv_signed i1 < bv_signed n - bv_signed i) ∧ ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ bv_signed i1 ∧ bv_signed i1 ≤ bv_signed n) ∧ 0%Z ≤ bv_signed ms ∧ bv_signed ms = sum a lo hi) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ bv_signed i1 -> sum a l' h' ≤ bv_signed ms) ∧ ((0%Z ≤ bv_signed i ∧ bv_signed i ≤ bv_signed i1) ∧ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant) = sum a (bv_signed i) (bv_signed i1)) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < bv_signed i1 -> sum a l' (bv_signed i1) ≤ bv_signed (nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant)))) else (0%Z ≤ bv_signed i ∧ bv_signed i < bv_signed (array63_length a)) ∧ (let o1 : bv 63%N := nth (Z.to_nat (bv_signed i)) (array63_elts a) inhabitant in int'63_in_bounds (bv_signed s + bv_signed o1) ∧ (∀(s1 : bv 63%N), bv_signed s1 = bv_signed s + bv_signed o1 -> (if decide (bv_signed ms < bv_signed s1) then bv_signed i < 4611686018427387903%Z ∧ (∀(i1 : bv 63%N), bv_signed i1 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed n - bv_signed i ∧ bv_signed n - bv_signed i1 < bv_signed n - bv_signed i) ∧ ((0%Z ≤ l ∧ l ≤ bv_signed i + 1%Z ∧ bv_signed i + 1%Z ≤ bv_signed i1 ∧ bv_signed i1 ≤ bv_signed n) ∧ 0%Z ≤ bv_signed s1 ∧ bv_signed s1 = sum a l (bv_signed i + 1%Z)) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ bv_signed i1 -> sum a l' h' ≤ bv_signed s1) ∧ ((0%Z ≤ l ∧ l ≤ bv_signed i1) ∧ bv_signed s1 = sum a l (bv_signed i1)) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < bv_signed i1 -> sum a l' (bv_signed i1) ≤ bv_signed s1)) else bv_signed i < 4611686018427387903%Z ∧ (∀(i1 : bv 63%N), bv_signed i1 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed n - bv_signed i ∧ bv_signed n - bv_signed i1 < bv_signed n - bv_signed i) ∧ ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ bv_signed i1 ∧ bv_signed i1 ≤ bv_signed n) ∧ 0%Z ≤ bv_signed ms ∧ bv_signed ms = sum a lo hi) ∧ (∀(l' : Z) (h' : Z), 0%Z ≤ l' ∧ l' ≤ h' ∧ h' ≤ bv_signed i1 -> sum a l' h' ≤ bv_signed ms) ∧ ((0%Z ≤ l ∧ l ≤ bv_signed i1) ∧ bv_signed s1 = sum a l (bv_signed i1)) ∧ (∀(l' : Z), 0%Z ≤ l' ∧ l' < bv_signed i1 -> sum a l' (bv_signed i1) ≤ bv_signed s1))))) else ((0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ bv_signed (array63_length a)) ∧ bv_signed ms = sum a lo hi) ∧ (∀(l1 : Z) (h : Z), 0%Z ≤ l1 ∧ l1 ≤ h ∧ h ≤ bv_signed (array63_length a) -> sum a lo hi ≤ bv_signed ms))).
Admitted.
