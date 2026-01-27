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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Definition sorted_sub (a : list elt) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 < i2 ∧ i2 < u -> le (nth (Z.to_nat i1) a inhabitant) (nth (Z.to_nat i2) a inhabitant).
Definition sorted (a : list elt) := ∀(i1 : Z) (i2 : Z), 0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < Z.of_nat (length a) -> le (nth (Z.to_nat i1) a inhabitant) (nth (Z.to_nat i2) a inhabitant).
Theorem merge'vc (l : Z) (m : Z) (r : Z) (tmp : list elt) (a : list elt) (fact0 : 0%Z ≤ l) (fact1 : l ≤ m) (fact2 : m ≤ r) (fact3 : r ≤ Z.of_nat (length tmp)) (fact4 : length tmp = length a) (fact5 : sorted_sub tmp l m) (fact6 : sorted_sub tmp m r) : let o1 : Z := r - 1%Z in (l ≤ o1 + 1%Z -> ((l ≤ l ∧ l ≤ m ∧ m ≤ m ∧ m ≤ r) ∧ l - l + m - m = l - l ∧ sorted_sub a l l ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < l -> l ≤ y ∧ y < m -> le (nth (Z.to_nat x) a inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < l -> m ≤ y ∧ y < r -> le (nth (Z.to_nat x) a inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(v : elt), Z.of_nat (map_occ_list v (nth_i tmp) l l) + Z.of_nat (map_occ_list v (nth_i tmp) m m) = Z.of_nat (map_occ_list v (nth_i a) l l))) ∧ (∀(j : Z) (i : Z) (a1 : list elt), length a1 = length a -> (∀(k : Z), (l ≤ k ∧ k ≤ o1) ∧ (l ≤ i ∧ i ≤ m ∧ m ≤ j ∧ j ≤ r) ∧ i - l + j - m = k - l ∧ sorted_sub a1 l k ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < k -> i ≤ y ∧ y < m -> le (nth (Z.to_nat x) a1 inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < k -> j ≤ y ∧ y < r -> le (nth (Z.to_nat x) a1 inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(v : elt), Z.of_nat (map_occ_list v (nth_i tmp) l i) + Z.of_nat (map_occ_list v (nth_i tmp) m j) = Z.of_nat (map_occ_list v (nth_i a1) l k)) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < l ∨ r ≤ i1 ∧ i1 < Z.of_nat (length a1) -> nth (Z.to_nat i1) a1 inhabitant = nth (Z.to_nat i1) a inhabitant) -> (i < m -> ¬ j = r -> (0%Z ≤ j ∧ j < Z.of_nat (length tmp)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length tmp)) ∧ (∀(o2 : bool), (if decide (i < m) then if decide (j = r) then o2 = true else o2 = (if decide (le (nth (Z.to_nat i) tmp inhabitant) (nth (Z.to_nat j) tmp inhabitant)) then true else false) else o2 = false) -> (if decide (o2 = true) then (0%Z ≤ i ∧ i < Z.of_nat (length tmp)) ∧ (let o3 : elt := nth (Z.to_nat i) tmp inhabitant in (0%Z ≤ k ∧ k < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat k) o3) = length a1 -> nth_i (set_list a1 (Z.to_nat k) o3) = fun_updt (nth_i a1) k o3 -> (l ≤ i + 1%Z ∧ i + 1%Z ≤ m ∧ m ≤ j ∧ j ≤ r) ∧ i + 1%Z - l + j - m = k + 1%Z - l ∧ sorted_sub (set_list a1 (Z.to_nat k) o3) l (k + 1%Z) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < k + 1%Z -> i + 1%Z ≤ y ∧ y < m -> le (nth (Z.to_nat x) (set_list a1 (Z.to_nat k) o3) inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < k + 1%Z -> j ≤ y ∧ y < r -> le (nth (Z.to_nat x) (set_list a1 (Z.to_nat k) o3) inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(v : elt), Z.of_nat (map_occ_list v (nth_i tmp) l (i + 1%Z)) + Z.of_nat (map_occ_list v (nth_i tmp) m j) = Z.of_nat (map_occ_list v (nth_i (set_list a1 (Z.to_nat k) o3)) l (k + 1%Z))) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < l ∨ r ≤ i1 ∧ i1 < Z.of_nat (length (set_list a1 (Z.to_nat k) o3)) -> nth (Z.to_nat i1) (set_list a1 (Z.to_nat k) o3) inhabitant = nth (Z.to_nat i1) a inhabitant))) else (0%Z ≤ j ∧ j < Z.of_nat (length tmp)) ∧ (let o3 : elt := nth (Z.to_nat j) tmp inhabitant in (0%Z ≤ k ∧ k < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat k) o3) = length a1 -> nth_i (set_list a1 (Z.to_nat k) o3) = fun_updt (nth_i a1) k o3 -> (l ≤ i ∧ i ≤ m ∧ m ≤ j + 1%Z ∧ j + 1%Z ≤ r) ∧ i - l + (j + 1%Z) - m = k + 1%Z - l ∧ sorted_sub (set_list a1 (Z.to_nat k) o3) l (k + 1%Z) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < k + 1%Z -> i ≤ y ∧ y < m -> le (nth (Z.to_nat x) (set_list a1 (Z.to_nat k) o3) inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < k + 1%Z -> j + 1%Z ≤ y ∧ y < r -> le (nth (Z.to_nat x) (set_list a1 (Z.to_nat k) o3) inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(v : elt), Z.of_nat (map_occ_list v (nth_i tmp) l i) + Z.of_nat (map_occ_list v (nth_i tmp) m (j + 1%Z)) = Z.of_nat (map_occ_list v (nth_i (set_list a1 (Z.to_nat k) o3)) l (k + 1%Z))) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < l ∨ r ≤ i1 ∧ i1 < Z.of_nat (length (set_list a1 (Z.to_nat k) o3)) -> nth (Z.to_nat i1) (set_list a1 (Z.to_nat k) o3) inhabitant = nth (Z.to_nat i1) a inhabitant)))))) ∧ ((l ≤ i ∧ i ≤ m ∧ m ≤ j ∧ j ≤ r) ∧ i - l + j - m = o1 + 1%Z - l ∧ sorted_sub a1 l (o1 + 1%Z) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < o1 + 1%Z -> i ≤ y ∧ y < m -> le (nth (Z.to_nat x) a1 inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(x : Z) (y : Z), l ≤ x ∧ x < o1 + 1%Z -> j ≤ y ∧ y < r -> le (nth (Z.to_nat x) a1 inhabitant) (nth (Z.to_nat y) tmp inhabitant)) ∧ (∀(v : elt), Z.of_nat (map_occ_list v (nth_i tmp) l i) + Z.of_nat (map_occ_list v (nth_i tmp) m j) = Z.of_nat (map_occ_list v (nth_i a1) l (o1 + 1%Z))) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < l ∨ r ≤ i1 ∧ i1 < Z.of_nat (length a1) -> nth (Z.to_nat i1) a1 inhabitant = nth (Z.to_nat i1) a inhabitant) -> sorted_sub a1 l r ∧ permut_sub tmp a1 (Z.to_nat l) (Z.to_nat r) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < l ∨ r ≤ i1 ∧ i1 < Z.of_nat (length a1) -> nth (Z.to_nat i1) a1 inhabitant = nth (Z.to_nat i1) a inhabitant)))) ∧ (o1 + 1%Z < l -> sorted_sub a l r ∧ permut_sub tmp a (Z.to_nat l) (Z.to_nat r)).
Admitted.
