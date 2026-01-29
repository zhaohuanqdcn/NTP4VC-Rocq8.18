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
Require Import queens_bv_vcg.queens_bv.S.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom bv : t -> definitions.bv 32%N.
Axiom mdl : t -> gset Z.
Axiom t'invariant : forall  (i : Z) (self : t), ((0%Z ≤ i ∧ i < 32%Z) ∧ Z.testbit (bv_unsigned (bv self)) i = true) = (i ∈ mdl self).
Definition t'eq (a : t) (b : t) := bv a = bv b ∧ mdl a = mdl b.
Axiom t'inj : forall  (a : t) (b : t) (fact0 : t'eq a b), a = b.
Theorem diff'vc (a : t) (b : t) : let o1 : gset Z := mdl a ∖ mdl b in let o2 : definitions.bv 32%N := bv_and (bv a) (bv_not (bv b)) in (∀(i : Z), ((0%Z ≤ i ∧ i < 32%Z) ∧ Z.testbit (bv_unsigned o2) i = true) = (i ∈ o1)) ∧ (∀(result : t), bv result = o2 ∧ mdl result = o1 -> mdl result = mdl a ∖ mdl b).
Proof.
Admitted.
