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
Theorem merge'vc (l1 : list elt) (l2 : list elt) (fact0 : sorted l1) (fact1 : sorted l2) : (match l2 with | [] => (match l1 with | [] => True | _ => True end) | cons x x1 => (match l1 with | [] => True | cons x2 x3 => (if decide (le x2 x) then (0%Z ≤ Z.of_nat (length l1) + Z.of_nat (length l2) ∧ Z.of_nat (length x3) + Z.of_nat (length l2) < Z.of_nat (length l1) + Z.of_nat (length l2)) ∧ sorted x3 ∧ sorted l2 else (0%Z ≤ Z.of_nat (length l1) + Z.of_nat (length l2) ∧ Z.of_nat (length l1) + Z.of_nat (length x1) < Z.of_nat (length l1) + Z.of_nat (length l2)) ∧ sorted l1 ∧ sorted x1) end) end) ∧ (∀(result : list elt), (match l2 with | [] => (match l1 with | [] => result = l2 | _ => result = l1 end) | cons x x1 => (match l1 with | [] => result = l2 | cons x2 x3 => (if decide (le x2 x) then ∃(o1 : list elt), (sorted o1 ∧ o1 ≡ₚ x3 ++ l2) ∧ result = cons x2 o1 else ∃(o1 : list elt), (sorted o1 ∧ o1 ≡ₚ l1 ++ x1) ∧ result = cons x o1) end) end) -> sorted result ∧ result ≡ₚ l1 ++ l2).
Proof.
Admitted.
