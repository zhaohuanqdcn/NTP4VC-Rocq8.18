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
Theorem insertion_sort'vc (l : list elt) : (match l with | [] => True | cons x r => (match l with | [] => False | cons _ f => f = r end) ∧ (∀(o1 : list elt), sorted o1 ∧ r ≡ₚ o1 -> sorted o1) end) ∧ (∀(result : list elt), (match l with | [] => result = ([] : list elt) | cons x r => (∃(o1 : list elt), (sorted o1 ∧ r ≡ₚ o1) ∧ sorted result ∧ cons x o1 ≡ₚ result) end) -> sorted result ∧ l ≡ₚ result).
Admitted.
