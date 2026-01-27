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
Inductive sorted : list Z -> Prop :=
 | Sorted_Nil : sorted ([] : list Z)
 | Sorted_One (x : Z) : sorted (cons x ([] : list Z))
 | Sorted_Two (x : Z) (y : Z) (l : list Z) : x < y -> sorted (cons y l) -> sorted (cons x (cons y l)).
Axiom sorted_mem : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> x < y) ∧ sorted l) = sorted (cons x l).
Axiom sorted_append : forall  (l1 : list Z) (l2 : list Z), (sorted l1 ∧ sorted l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> x < y)) = sorted (l1 ++ l2).
Theorem coincidence_count'vc (a : list Z) (b : list Z) (fact0 : sorted a) (fact1 : sorted b) : (match b with | cons x x1 => (match a with | cons x2 x3 => (if decide (x2 = x) then ((match a with | [] => False | cons _ f => f = x3 end) ∨ a = x3 ∧ (match b with | [] => False | cons _ f => f = x1 end)) ∧ sorted x3 ∧ sorted x1 else if decide (x2 < x) then (match a with | [] => False | cons _ f => f = x3 end) ∧ sorted x3 ∧ sorted b else (match b with | [] => False | cons _ f => f = x1 end) ∧ sorted a ∧ sorted x1) | _ => True end) | _ => True end) ∧ (∀(result : gset Z), (match b with | cons x x1 => (match a with | cons x2 x3 => (if decide (x2 = x) then ∃(o1 : gset Z), o1 = list_to_gset x3 ∩ list_to_gset x1 ∧ result = insert_set x2 o1 ∧ (if decide (x2 ∈ o1) then size result = size o1 else Z.of_nat (size result) = Z.of_nat (size o1) + 1%Z) else if decide (x2 < x) then result = list_to_gset x3 ∩ list_to_gset b else result = list_to_gset a ∩ list_to_gset x1) | _ => result = (∅ : gset Z) ∧ Z.of_nat (size result) = 0%Z end) | _ => result = (∅ : gset Z) ∧ Z.of_nat (size result) = 0%Z end) -> result = list_to_gset a ∩ list_to_gset b).
Admitted.
