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
Theorem create'vc {α : Type} `{Inhabited α} (x : α) : let o1 : list α := ([] : list α) in 0%Z ≤ 10%Z ∧ (∀(o2 : list α), (∀(i : Z), 0%Z ≤ i ∧ i < 10%Z -> nth (Z.to_nat i) o2 inhabitant = x) ∧ Z.of_nat (length o2) = 10%Z -> (0%Z < Z.of_nat (length o2) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length o2)) ∧ Z.of_nat (length o1) = 0%Z - 0%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z - 0%Z -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat (0%Z + i)) o2 inhabitant)) ∧ (∀(result : t α), data result = o2 ∧ m result = 0%Z ∧ n result = 0%Z ∧ contents result = o1 -> contents result = ([] : list α))).
Admitted.
