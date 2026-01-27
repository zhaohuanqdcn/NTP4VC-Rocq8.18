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
Require Import Why3.int.NumOf.
Require Import Why3.queue.Queue.
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
Definition sorted_sub (s : list elt) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u -> le (nth (Z.to_nat i1) s inhabitant) (nth (Z.to_nat i2) s inhabitant).
Definition sorted (s : list elt) := sorted_sub s 0%Z (Z.of_nat (length s)).
Axiom sorted_cons : forall  (s : list elt) (x : elt), ((∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> le x (nth (Z.to_nat i) s inhabitant)) ∧ sorted s) = sorted (cons x s).
Axiom sorted_append : forall  (s1 : list elt) (s2 : list elt), (sorted s1 ∧ sorted s2 ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < Z.of_nat (length s1)) ∧ 0%Z ≤ j ∧ j < Z.of_nat (length s2) -> le (nth (Z.to_nat i) s1 inhabitant) (nth (Z.to_nat j) s2 inhabitant))) = sorted (s1 ++ s2).
Axiom sorted_snoc : forall  (s : list elt) (x : elt), ((∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> le (nth (Z.to_nat i) s inhabitant) x) ∧ sorted s) = sorted (s ++ [x]).
Theorem mergesort'vc (o1 : nat) (q : t elt) (fact0 : o1 = length (seq q)) : if decide (Z.of_nat 1%nat < Z.of_nat o1) then ∀(q1 : t elt), seq q1 = ([] : list elt) -> (∀(q2 : t elt), seq q2 = ([] : list elt) -> ((∀(x : elt), Z.of_nat (count_occ' (seq q1) x) + Z.of_nat (count_occ' (seq q2) x) + Z.of_nat (count_occ' (seq q) x) = Z.of_nat (count_occ' (seq q) x)) ∧ Z.of_nat (length (seq q)) = Z.of_nat (length (seq q1)) + Z.of_nat (length (seq q2)) + Z.of_nat (length (seq q)) ∧ (length (seq q1) = length (seq q2) ∨ Z.of_nat (length (seq q)) = 0%Z ∧ Z.of_nat (length (seq q1)) = Z.of_nat (length (seq q2)) + 1%Z)) ∧ (∀(q21 : t elt) (q11 : t elt) (q3 : t elt), (∀(x : elt), Z.of_nat (count_occ' (seq q11) x) + Z.of_nat (count_occ' (seq q21) x) + Z.of_nat (count_occ' (seq q3) x) = Z.of_nat (count_occ' (seq q) x)) ∧ Z.of_nat (length (seq q)) = Z.of_nat (length (seq q11)) + Z.of_nat (length (seq q21)) + Z.of_nat (length (seq q3)) ∧ (length (seq q11) = length (seq q21) ∨ Z.of_nat (length (seq q3)) = 0%Z ∧ Z.of_nat (length (seq q11)) = Z.of_nat (length (seq q21)) + 1%Z) -> (if decide (¬ seq q3 = ([] : list elt)) then ¬ seq q3 = ([] : list elt) ∧ (∀(q4 : t elt), seq q4 = drop 1%nat (seq q3) -> (∀(q12 : t elt), seq q12 = seq q11 ++ [nth 0%nat (seq q3) inhabitant] -> (if decide (¬ seq q4 = ([] : list elt)) then ¬ seq q4 = ([] : list elt) ∧ (∀(q5 : t elt), seq q5 = drop 1%nat (seq q4) -> (∀(q22 : t elt), seq q22 = seq q21 ++ [nth 0%nat (seq q4) inhabitant] -> (0%Z ≤ Z.of_nat (length (seq q3)) ∧ Z.of_nat (length (seq q5)) < Z.of_nat (length (seq q3))) ∧ (∀(x : elt), Z.of_nat (count_occ' (seq q12) x) + Z.of_nat (count_occ' (seq q22) x) + Z.of_nat (count_occ' (seq q5) x) = Z.of_nat (count_occ' (seq q) x)) ∧ Z.of_nat (length (seq q)) = Z.of_nat (length (seq q12)) + Z.of_nat (length (seq q22)) + Z.of_nat (length (seq q5)) ∧ (length (seq q12) = length (seq q22) ∨ Z.of_nat (length (seq q5)) = 0%Z ∧ Z.of_nat (length (seq q12)) = Z.of_nat (length (seq q22)) + 1%Z))) else (0%Z ≤ Z.of_nat (length (seq q3)) ∧ Z.of_nat (length (seq q4)) < Z.of_nat (length (seq q3))) ∧ (∀(x : elt), Z.of_nat (count_occ' (seq q12) x) + Z.of_nat (count_occ' (seq q21) x) + Z.of_nat (count_occ' (seq q4) x) = Z.of_nat (count_occ' (seq q) x)) ∧ Z.of_nat (length (seq q)) = Z.of_nat (length (seq q12)) + Z.of_nat (length (seq q21)) + Z.of_nat (length (seq q4)) ∧ (length (seq q12) = length (seq q21) ∨ Z.of_nat (length (seq q4)) = 0%Z ∧ Z.of_nat (length (seq q12)) = Z.of_nat (length (seq q21)) + 1%Z)))) else (0%Z ≤ Z.of_nat (length (seq q)) ∧ Z.of_nat (length (seq q11)) < Z.of_nat (length (seq q))) ∧ (∀(q12 : t elt), sorted (seq q12) ∧ seq q12 ≡ₚ seq q11 -> (0%Z ≤ Z.of_nat (length (seq q)) ∧ Z.of_nat (length (seq q21)) < Z.of_nat (length (seq q))) ∧ (∀(q22 : t elt), sorted (seq q22) ∧ seq q22 ≡ₚ seq q21 -> (seq q3 = ([] : list elt) ∧ sorted (seq q12) ∧ sorted (seq q22)) ∧ (∀(q4 : t elt), sorted (seq q4) ∧ Z.of_nat (length (seq q4)) = Z.of_nat (length (seq q12)) + Z.of_nat (length (seq q22)) ∧ (∀(x : elt), Z.of_nat (count_occ' (seq q4) x) = Z.of_nat (count_occ' (seq q12) x) + Z.of_nat (count_occ' (seq q22) x)) -> sorted (seq q4) ∧ seq q4 ≡ₚ seq q)))))) else sorted (seq q) ∧ seq q ≡ₚ seq q.
Admitted.
