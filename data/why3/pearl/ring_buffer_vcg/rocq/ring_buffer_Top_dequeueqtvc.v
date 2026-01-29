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
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom data : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom m : forall {α : Type} `{Inhabited α}, t α -> Z.
Axiom n : forall {α : Type} `{Inhabited α}, t α -> Z.
Axiom contents : forall {α : Type} `{Inhabited α}, t α -> list α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t α), 0%Z < Z.of_nat (length (data self)) ∧ 0%Z ≤ m self ∧ m self ≤ n self ∧ n self ≤ Z.of_nat (length (data self)) ∧ Z.of_nat (length (contents self)) = n self - m self ∧ (∀(i : Z), 0%Z ≤ i ∧ i < m self - n self -> nth (Z.to_nat i) (contents self) inhabitant = nth (Z.to_nat (m self + i)) (data self) inhabitant).
Definition t'eq {α : Type} `{Inhabited α} (a : t α) (b : t α) := data a = data b ∧ m a = m b ∧ n a = n b ∧ contents a = contents b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t α) (b : t α) (fact0 : t'eq a b), a = b.
Theorem dequeue'vc {α : Type} `{Inhabited α} (q : t α) (fact0 : 0%Z < Z.of_nat (length (contents q))) : let o1 : Z := m q in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length (data q))) ∧ (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length (contents q))) ∧ (∀(q1 : t α), (0%Z < Z.of_nat (length (data q)) ∧ (0%Z ≤ m q + 1%Z ∧ m q + 1%Z ≤ n q ∧ n q ≤ Z.of_nat (length (data q))) ∧ Z.of_nat (length (drop 1%nat (contents q))) = n q - (m q + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < m q + 1%Z - n q -> nth (Z.to_nat i) (drop 1%nat (contents q)) inhabitant = nth (Z.to_nat (m q + 1%Z + i)) (data q) inhabitant)) ∧ (drop 1%nat (contents q) = contents q1 ∧ n q = n q1 ∧ m q + 1%Z = m q1 ∧ data q = data q1 -> contents q1 = drop 1%nat (contents q))).
Proof.
Admitted.
