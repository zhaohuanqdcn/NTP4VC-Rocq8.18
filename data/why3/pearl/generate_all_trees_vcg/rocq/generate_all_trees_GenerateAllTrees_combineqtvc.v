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
Inductive tree :=
  | Empty : tree
  | Node : tree -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint size (t : tree) : Z :=
match t with | Empty => 0%Z | Node l r => 1%Z + size l + size r end.
Admit Obligations.
Definition all_trees (n : Z) (l : list tree) := NoDup l ∧ (∀(t : tree), (size t = n) = (t ∈ l)).
Theorem combine'vc (i1 : Z) (l1 : list tree) (i2 : Z) (l2 : list tree) (fact0 : 0%Z ≤ i1) (fact1 : all_trees i1 l1) (fact2 : 0%Z ≤ i2) (fact3 : all_trees i2 l2) : (∀(l11 : list tree), NoDup l11 -> (match l11 with | [] => True | cons t1 l12 => (∀(l21 : list tree), NoDup l21 -> (match l21 with | [] => True | cons t2 l22 => (match l21 with | [] => False | cons _ f => f = l22 end) ∧ NoDup l22 end) ∧ (∀(result : list tree), (match l21 with | [] => result = ([] : list tree) | cons t2 l22 => (∃(o1 : list tree), (NoDup o1 ∧ (∀(t : tree), (t ∈ o1) = (∃(r : tree), t = Node t1 r ∧ r ∈ l22))) ∧ result = cons (Node t1 t2) o1) end) -> NoDup result ∧ (∀(t : tree), (t ∈ result) = (∃(r : tree), t = Node t1 r ∧ r ∈ l21)))) ∧ ((match l11 with | [] => False | cons _ f => f = l12 end) ∧ NoDup l12) ∧ (∀(o1 : list tree), NoDup o1 ∧ (∀(t : tree), (t ∈ o1) = (∃(l : tree) (r : tree), t = Node l r ∧ l ∈ l12 ∧ r ∈ l2)) -> NoDup l2) end) ∧ (∀(result : list tree), (match l11 with | [] => result = ([] : list tree) | cons t1 l12 => (∃(o1 : list tree), (NoDup o1 ∧ (∀(t : tree), (t ∈ o1) = (∃(l : tree) (r : tree), t = Node l r ∧ l ∈ l12 ∧ r ∈ l2))) ∧ (∃(o2 : list tree), (NoDup o2 ∧ (∀(t : tree), (t ∈ o2) = (∃(r : tree), t = Node t1 r ∧ r ∈ l2))) ∧ result = o2 ++ o1)) end) -> NoDup result ∧ (∀(t : tree), (t ∈ result) = (∃(l : tree) (r : tree), t = Node l r ∧ l ∈ l11 ∧ r ∈ l2)))) ∧ NoDup l1 ∧ (∀(result : list tree), NoDup result ∧ (∀(t : tree), (t ∈ result) = (∃(l : tree) (r : tree), t = Node l r ∧ l ∈ l1 ∧ r ∈ l2)) -> NoDup result ∧ (∀(t : tree), (t ∈ result) = (∃(l : tree) (r : tree), t = Node l r ∧ size l = i1 ∧ size r = i2))).
Admitted.
