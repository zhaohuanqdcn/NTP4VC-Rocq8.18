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
Axiom k : Z.
Axiom k'def : 0%Z < k.
Axiom n : Z.
Axiom n'def : 0%Z < n.
Axiom bounded_int : Type.
Axiom bounded_int_inhabited : Inhabited bounded_int.
Global Existing Instance bounded_int_inhabited.
Axiom bounded_int_countable : Countable bounded_int.
Global Existing Instance bounded_int_countable.
Axiom bmodel : bounded_int -> Z.
Axiom bounded_int'invariant : forall  (self : bounded_int), 0%Z ≤ bmodel self ∧ bmodel self < k * n.
Axiom bzero : bounded_int.
Axiom bzero'def : bmodel bzero = 0%Z.
Axiom bounded_int2 : Type.
Axiom bounded_int2_inhabited : Inhabited bounded_int2.
Global Existing Instance bounded_int2_inhabited.
Axiom bounded_int2_countable : Countable bounded_int2.
Global Existing Instance bounded_int2_countable.
Axiom value : bounded_int2 -> bounded_int.
Axiom model : bounded_int2 -> Z.
Axiom bounded_int2'invariant : forall  (self : bounded_int2), 0%Z ≤ model self ∧ model self < n ∧ model self = Z.quot (bmodel (value self)) n.
Definition bounded_int2'eq (a : bounded_int2) (b : bounded_int2) := value a = value b ∧ model a = model b.
Axiom bounded_int2'inj : forall  (a : bounded_int2) (b : bounded_int2) (fact0 : bounded_int2'eq a b), a = b.
Axiom ticket : Type.
Axiom ticket_inhabited : Inhabited ticket.
Global Existing Instance ticket_inhabited.
Axiom ticket_countable : Countable ticket.
Global Existing Instance ticket_countable.
Axiom tvalue : ticket -> Z.
Axiom ticket'invariant : forall  (self : ticket), 0%Z ≤ tvalue self ∧ tvalue self < n.
Definition ticket'eq (a : ticket) (b : ticket) := tvalue a = tvalue b.
Axiom ticket'inj : forall  (a : ticket) (b : ticket) (fact0 : ticket'eq a b), a = b.
Theorem tinc'vc (t : ticket) : let o1 : Z := n in ¬ o1 = 0%Z ∧ (let o2 : Z := Z.quot (tvalue t + 1%Z) o1 in (0%Z ≤ o2 ∧ o2 < n) ∧ (∀(result : ticket), tvalue result = o2 -> (let v : Z := tvalue t + 1%Z in tvalue result = (if decide (v = n) then 0%Z else v)))).
Proof.
Admitted.
