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
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Inductive sorted : list elt -> Prop :=
 | Sorted_Nil : sorted ([] : list elt)
 | Sorted_One (x : elt) : sorted (cons x ([] : list elt))
 | Sorted_Two (x : elt) (y : elt) (l : list elt) : le x y -> sorted (cons y l) -> sorted (cons x (cons y l)).
Axiom sorted_mem : forall  (l : list elt) (x : elt), ((∀(y : elt), y ∈ l -> le x y) ∧ sorted l) = sorted (cons x l).
Axiom sorted_append : forall  (l1 : list elt) (l2 : list elt), (sorted l1 ∧ sorted l2 ∧ (∀(x : elt) (y : elt), x ∈ l1 -> y ∈ l2 -> le x y)) = sorted (l1 ++ l2).
Theorem split'vc {α : Type} `{Inhabited α} (l0 : list α) (fact0 : 2%Z ≤ Z.of_nat (length l0)) : (∀(l1 : list α) (l2 : list α) (l : list α), length l2 = length l1 ∨ Z.of_nat (length l2) = Z.of_nat (length l1) + 1%Z -> (match l with | [] => True | cons x r => (let o1 : list α := cons x l1 in (0%Z ≤ Z.of_nat (length l) ∧ Z.of_nat (length r) < Z.of_nat (length l)) ∧ (length o1 = length l2 ∨ Z.of_nat (length o1) = Z.of_nat (length l2) + 1%Z)) end) ∧ (∀(r1 : list α) (r2 : list α), (match l with | [] => r1 = l1 ∧ r2 = l2 | cons x r => (length r2 = length r1 ∨ Z.of_nat (length r2) = Z.of_nat (length r1) + 1%Z) ∧ r1 ++ r2 ≡ₚ l2 ++ cons x l1 ++ r end) -> (length r2 = length r1 ∨ Z.of_nat (length r2) = Z.of_nat (length r1) + 1%Z) ∧ r1 ++ r2 ≡ₚ l1 ++ l2 ++ l)) ∧ (let o1 : list α := ([] : list α) in let o2 : list α := ([] : list α) in (length o1 = length o2 ∨ Z.of_nat (length o1) = Z.of_nat (length o2) + 1%Z) ∧ (∀(l1 : list α) (l2 : list α), (length l2 = length l1 ∨ Z.of_nat (length l2) = Z.of_nat (length l1) + 1%Z) ∧ l1 ++ l2 ≡ₚ o2 ++ o1 ++ l0 -> 1%Z ≤ Z.of_nat (length l1) ∧ 1%Z ≤ Z.of_nat (length l2) ∧ l0 ≡ₚ l1 ++ l2)).
Admitted.
