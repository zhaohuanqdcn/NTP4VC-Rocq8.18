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
Require Import Why3.why3.WellFounded.WellFounded.
Open Scope Z_scope.
Axiom s : Type.
Axiom s_inhabited : Inhabited s.
Global Existing Instance s_inhabited.
Axiom s_countable : Countable s.
Global Existing Instance s_countable.
Axiom bv : s -> definitions.bv 64%N.
Axiom mdl : s -> gset Z.
Axiom s'invariant : forall  (i : Z) (self : s), ((0%Z ≤ i ∧ i < 64%Z) ∧ Z.testbit (bv_unsigned (bv self)) i = true) = (i ∈ mdl self).
Definition s'eq (a : s) (b : s) := bv a = bv b ∧ mdl a = mdl b.
Axiom s'inj : forall  (a : s) (b : s) (fact0 : s'eq a b), a = b.
Theorem maxUnion'vc (a : s) (b : s) (fact0 : ¬ mdl a = ∅) (fact1 : ¬ mdl b = ∅) : ¬ mdl b = ∅ ∧ (∀(o1 : s), mdl o1 = gset_interval (gset_min (mdl b)) 64%Z -> ¬ mdl a = ∅ ∧ (∀(o2 : s), mdl o2 = gset_interval (gset_min (mdl a)) 64%Z -> (∀(o3 : s), mdl o3 = mdl o2 ∩ mdl o1 -> (∀(o4 : s), mdl o4 = mdl b ∪ mdl a -> (∀(res : s), mdl res = mdl o4 ∩ mdl o3 -> (∀(x : Z), (x ∈ mdl res) = (x ∈ mdl a ∪ mdl b ∧ Z.max (gset_min (mdl a)) (gset_min (mdl b)) ≤ x)) ∧ (∀(x : Z), (x ∈ mdl res) = (∃(y : Z) (z : Z), y ∈ mdl a ∧ z ∈ mdl b ∧ x = Z.max y z))))))).
Admitted.
