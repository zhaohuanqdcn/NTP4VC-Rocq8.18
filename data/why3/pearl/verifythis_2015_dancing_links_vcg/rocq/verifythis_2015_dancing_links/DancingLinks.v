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
Axiom dll : Type.
Axiom dll_inhabited : Inhabited dll.
Global Existing Instance dll_inhabited.
Axiom dll_countable : Countable dll.
Global Existing Instance dll_countable.
Axiom prev : dll -> list Z.
Axiom next : dll -> list Z.
Axiom n : dll -> Z.
Axiom dll'invariant : forall  (self : dll), length (prev self) = length (next self) ∧ Z.of_nat (length (next self)) = n self.
Definition dll'eq (a : dll) (b : dll) := prev a = prev b ∧ next a = next b ∧ n a = n b.
Axiom dll'inj : forall  (a : dll) (b : dll) (fact0 : dll'eq a b), a = b.
Definition valid_in (l : dll) (i : Z) := (0%Z ≤ i ∧ i < n l) ∧ (0%Z ≤ nth (Z.to_nat i) (prev l) inhabitant ∧ nth (Z.to_nat i) (prev l) inhabitant < n l) ∧ (0%Z ≤ nth (Z.to_nat i) (next l) inhabitant ∧ nth (Z.to_nat i) (next l) inhabitant < n l) ∧ nth (Z.to_nat (nth (Z.to_nat i) (prev l) inhabitant)) (next l) inhabitant = i ∧ nth (Z.to_nat (nth (Z.to_nat i) (next l) inhabitant)) (prev l) inhabitant = i.
Definition valid_out (l : dll) (i : Z) := (0%Z ≤ i ∧ i < n l) ∧ (0%Z ≤ nth (Z.to_nat i) (prev l) inhabitant ∧ nth (Z.to_nat i) (prev l) inhabitant < n l) ∧ (0%Z ≤ nth (Z.to_nat i) (next l) inhabitant ∧ nth (Z.to_nat i) (next l) inhabitant < n l) ∧ nth (Z.to_nat (nth (Z.to_nat i) (prev l) inhabitant)) (next l) inhabitant = nth (Z.to_nat i) (next l) inhabitant ∧ nth (Z.to_nat (nth (Z.to_nat i) (next l) inhabitant)) (prev l) inhabitant = nth (Z.to_nat i) (prev l) inhabitant.
Definition is_list (l : dll) (s : list Z) := ∀(k : Z), 0%Z ≤ k ∧ k < Z.of_nat (length s) -> (0%Z ≤ nth (Z.to_nat k) s inhabitant ∧ nth (Z.to_nat k) s inhabitant < n l) ∧ nth (Z.to_nat (nth (Z.to_nat k) s inhabitant)) (prev l) inhabitant = nth (Z.to_nat (if decide (k = 0%Z) then Z.of_nat (length s) - 1%Z else k - 1%Z)) s inhabitant ∧ nth (Z.to_nat (nth (Z.to_nat k) s inhabitant)) (next l) inhabitant = nth (Z.to_nat (if decide (k = Z.of_nat (length s) - 1%Z) then 0%Z else k + 1%Z)) s inhabitant ∧ (∀(k' : Z), 0%Z ≤ k' ∧ k' < Z.of_nat (length s) -> ¬ k = k' -> ¬ nth (Z.to_nat k) s inhabitant = nth (Z.to_nat k') s inhabitant).
