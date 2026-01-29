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
Theorem enqueue'vc {α : Type} `{Inhabited α} (q : t α) (x : α) (fact0 : n q < Z.of_nat (length (data q))) : let o1 : Z := n q in let o2 : list α := data q in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length o2)) ∧ (length (set_list o2 (Z.to_nat o1) x) = length o2 -> length (set_list o2 (Z.to_nat o1) x) = length (data q) -> nth_i (set_list o2 (Z.to_nat o1) x) = fun_updt (nth_i o2) o1 x -> (let o3 : list α := contents q ++ [x] in Z.of_nat (length o3) = 1%Z + Z.of_nat (length (contents q)) ∧ nth (length (contents q)) o3 inhabitant = x ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (contents q)) -> nth (Z.to_nat i) o3 inhabitant = nth (Z.to_nat i) (contents q) inhabitant) -> (∀(q1 : t α), (0%Z < Z.of_nat (length (set_list o2 (Z.to_nat o1) x)) ∧ (0%Z ≤ m q ∧ m q ≤ n q + 1%Z ∧ n q + 1%Z ≤ Z.of_nat (length (set_list o2 (Z.to_nat o1) x))) ∧ Z.of_nat (length o3) = n q + 1%Z - m q ∧ (∀(i : Z), 0%Z ≤ i ∧ i < m q - (n q + 1%Z) -> nth (Z.to_nat i) o3 inhabitant = nth (Z.to_nat (m q + i)) (set_list o2 (Z.to_nat o1) x) inhabitant)) ∧ (o3 = contents q1 ∧ n q + 1%Z = n q1 ∧ m q = m q1 ∧ set_list o2 (Z.to_nat o1) x = data q1 -> contents q1 = contents q ++ [x])))).
Proof.
Admitted.
