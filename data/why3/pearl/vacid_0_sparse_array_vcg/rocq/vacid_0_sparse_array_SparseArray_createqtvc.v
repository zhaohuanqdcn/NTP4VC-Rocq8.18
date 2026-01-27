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
Axiom sparse_array : Type -> Type.
Axiom sparse_array_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (sparse_array α).
Global Existing Instance sparse_array_inhabited.
Axiom values : forall {α : Type} `{Inhabited α}, sparse_array α -> list α.
Axiom index : forall {α : Type} `{Inhabited α}, sparse_array α -> list Z.
Axiom back : forall {α : Type} `{Inhabited α}, sparse_array α -> list Z.
Axiom card : forall {α : Type} `{Inhabited α}, sparse_array α -> Z.
Axiom def1 : forall {α : Type} `{Inhabited α}, sparse_array α -> α.
Axiom sparse_array'invariant : forall  {α : Type} `{Inhabited α} (self : sparse_array α), 0%Z ≤ card self ∧ card self ≤ Z.of_nat (length (values self)) ∧ Z.of_nat (length (values self)) ≤ 1000%Z ∧ length (values self) = length (index self) ∧ length (index self) = length (back self) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < card self -> (0%Z ≤ nth (Z.to_nat i) (back self) inhabitant ∧ nth (Z.to_nat i) (back self) inhabitant < Z.of_nat (length (values self))) ∧ nth (Z.to_nat (nth (Z.to_nat i) (back self) inhabitant)) (index self) inhabitant = i).
Definition sparse_array'eq {α : Type} `{Inhabited α} (a : sparse_array α) (b : sparse_array α) := values a = values b ∧ index a = index b ∧ back a = back b ∧ card a = card b ∧ def1 a = def1 b.
Axiom sparse_array'inj : forall  {α : Type} `{Inhabited α} (a : sparse_array α) (b : sparse_array α) (fact0 : sparse_array'eq a b), a = b.
Definition is_elt {α : Type} `{Inhabited α} (a : sparse_array α) (i : Z) := (0%Z ≤ nth (Z.to_nat i) (index a) inhabitant ∧ nth (Z.to_nat i) (index a) inhabitant < card a) ∧ nth (Z.to_nat (nth (Z.to_nat i) (index a) inhabitant)) (back a) inhabitant = i.
Definition value {α : Type} `{Inhabited α} (a : sparse_array α) (i : Z) : α := if decide (is_elt a i) then nth (Z.to_nat i) (values a) inhabitant else def1 a.
Definition length {α : Type} `{Inhabited α} (a : sparse_array α) : Z := Z.of_nat (List.length (values a)).
Theorem create'vc {α : Type} `{Inhabited α} (sz : Z) (o1 : list Z) (o2 : list Z) (o3 : list α) (d : α) (fact0 : 0%Z ≤ sz) (fact1 : sz ≤ 1000%Z) (fact2 : Z.of_nat (List.length o1) = sz) (fact3 : Z.of_nat (List.length o2) = sz) (fact4 : Z.of_nat (List.length o3) = sz) : 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (List.length o3) ∧ Z.of_nat (List.length o3) ≤ 1000%Z ∧ List.length o3 = List.length o2 ∧ List.length o2 = List.length o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> (0%Z ≤ nth (Z.to_nat i) o1 inhabitant ∧ nth (Z.to_nat i) o1 inhabitant < Z.of_nat (List.length o3)) ∧ nth (Z.to_nat (nth (Z.to_nat i) o1 inhabitant)) o2 inhabitant = i) ∧ (∀(result : sparse_array α), values result = o3 ∧ index result = o2 ∧ back result = o1 ∧ card result = 0%Z ∧ def1 result = d -> card result = 0%Z ∧ def1 result = d ∧ length result = sz).
Admitted.
