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
Axiom buffer : Type -> Type.
Axiom buffer_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (buffer α).
Global Existing Instance buffer_inhabited.
Axiom first : forall {α : Type} `{Inhabited α}, buffer α -> Z.
Axiom len : forall {α : Type} `{Inhabited α}, buffer α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, buffer α -> list α.
Axiom sequence : forall {α : Type} `{Inhabited α}, buffer α -> list α.
Axiom buffer'invariant : forall  {α : Type} `{Inhabited α} (self : buffer α), (0%Z ≤ first self ∧ first self < Z.of_nat (length (data self))) ∧ (0%Z ≤ len self ∧ len self ≤ Z.of_nat (length (data self))) ∧ len self = Z.of_nat (length (sequence self)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len self -> (first self + i < Z.of_nat (length (data self)) -> nth (Z.to_nat i) (sequence self) inhabitant = nth (Z.to_nat (first self + i)) (data self) inhabitant) ∧ (0%Z ≤ first self + i - Z.of_nat (length (data self)) -> nth (Z.to_nat i) (sequence self) inhabitant = nth (Z.to_nat (first self + i - Z.of_nat (length (data self)))) (data self) inhabitant)).
Definition buffer'eq {α : Type} `{Inhabited α} (a : buffer α) (b : buffer α) := first a = first b ∧ len a = len b ∧ data a = data b ∧ sequence a = sequence b.
Axiom buffer'inj : forall  {α : Type} `{Inhabited α} (a : buffer α) (b : buffer α) (fact0 : buffer'eq a b), a = b.
Definition size {α : Type} `{Inhabited α} (b : buffer α) : Z := Z.of_nat (length (data b)).
Theorem push'vc {α : Type} `{Inhabited α} (b : buffer α) (x : α) (fact0 : len b < size b) : let o1 : list α := sequence b in let o2 : list α := o1 ++ [x] in Z.of_nat (length o2) = 1%Z + Z.of_nat (length o1) ∧ nth (length o1) o2 inhabitant = x ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o1) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat i) o1 inhabitant) -> (let i : Z := first b + len b in let n : Z := Z.of_nat (length (data b)) in ∀(o3 : Z), (if decide (n ≤ i) then o3 = i - n else o3 = i) -> (0%Z ≤ o3 ∧ o3 < Z.of_nat (length (data b))) ∧ (length (set_list (data b) (Z.to_nat o3) x) = length (data b) -> length (set_list (data b) (Z.to_nat o3) x) = length (data b) -> nth_i (set_list (data b) (Z.to_nat o3) x) = fun_updt (nth_i (data b)) o3 x -> (∀(b1 : buffer α), (let size1 : Z := Z.of_nat (length (set_list (data b) (Z.to_nat o3) x)) in (0%Z ≤ first b ∧ first b < size1) ∧ (0%Z ≤ len b + 1%Z ∧ len b + 1%Z ≤ size1) ∧ len b + 1%Z = Z.of_nat (length o2) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < len b + 1%Z -> (first b + i1 < size1 -> nth (Z.to_nat i1) o2 inhabitant = nth (Z.to_nat (first b + i1)) (set_list (data b) (Z.to_nat o3) x) inhabitant) ∧ (0%Z ≤ first b + i1 - size1 -> nth (Z.to_nat i1) o2 inhabitant = nth (Z.to_nat (first b + i1 - size1)) (set_list (data b) (Z.to_nat o3) x) inhabitant))) ∧ (o2 = sequence b1 ∧ set_list (data b) (Z.to_nat o3) x = data b1 ∧ len b + 1%Z = len b1 ∧ first b = first b1 -> len b1 = len b + 1%Z ∧ sequence b1 = sequence b ++ [x])))).
Admitted.
