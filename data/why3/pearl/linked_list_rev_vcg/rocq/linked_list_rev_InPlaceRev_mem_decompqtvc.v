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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom eq_loc : loc -> loc -> bool.
Axiom eq_loc'spec : forall  (l1 : loc) (l2 : loc), (eq_loc l1 l2 = true) = (l1 = l2).
Axiom null : loc.
Definition disjoint (l1 : list loc) (l2 : list loc) := ∀(x : loc), ¬ (x ∈ l1 ∧ x ∈ l2).
Program Fixpoint no_repet (l : list loc) : Prop :=
match l with | [] => True | cons x r => ¬ x ∈ r ∧ no_repet r end.
Admit Obligations.
Theorem mem_decomp'vc (x : loc) (l : list loc) (fact0 : x ∈ l) : (match l with | [] => False | cons h t => (let o1 : bool := eq_loc h x in (o1 = true) = (h = x) -> ¬ o1 = true -> (match l with | [] => False | cons _ f => f = t end) ∧ x ∈ t) end) ∧ (∀(l1 : list loc) (l2 : list loc), (match l with | [] => False | cons h t => (let o1 : bool := eq_loc h x in (o1 = true) = (h = x) ∧ (if decide (o1 = true) then l1 = ([] : list loc) ∧ l2 = t else ∃(l11 : list loc), t = l11 ++ cons x l2 ∧ l1 = cons h l11)) end) -> l = l1 ++ cons x l2).
Proof.
Admitted.
