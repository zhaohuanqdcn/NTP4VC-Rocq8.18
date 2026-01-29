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
Theorem intersection'vc (a : s) (b : s) : let o1 : gset Z := mdl a ∩ mdl b in let o2 : definitions.bv 64%N := bv_and (bv a) (bv b) in (∀(i : Z), ((0%Z ≤ i ∧ i < 64%Z) ∧ Z.testbit (bv_unsigned o2) i = true) = (i ∈ o1)) ∧ (∀(result : s), bv result = o2 ∧ mdl result = o1 -> mdl result = mdl a ∩ mdl b).
Proof.
Admitted.
