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
Require Import Why3.map.Const.
Open Scope Z_scope.
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom hash : key -> Z.
Axiom hash'spec : forall  (x : key), 0%Z ≤ hash x.
Axiom bucket : key -> Z -> Z.
Axiom bucket'def : forall  (n : Z) (k : key) (fact0 : 0%Z < n), bucket k n = Z.quot (hash k) n.
Axiom bucket'spec : forall  (n : Z) (k : key) (fact0 : 0%Z < n), 0%Z ≤ bucket k n ∧ bucket k n < n.
Definition in_data {α : Type} `{Inhabited α} (k : key) (v : α) (d : list (list (key * α))) := (k, v) ∈ nth (Z.to_nat (bucket k (Z.of_nat (length d)))) d inhabitant.
Definition good_data {α : Type} `{Inhabited α} (k : key) (v : α) (m : key -> option α) (d : list (list (key * α))) := (m k = Some v) = in_data k v d.
Definition good_hash {α : Type} `{Inhabited α} (d : list (list (key * α))) (i : Z) := ∀(k : key) (v : α), (k, v) ∈ nth (Z.to_nat i) d inhabitant -> bucket k (Z.of_nat (length d)) = i.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom size : forall {α : Type} `{Inhabited α}, t α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, t α -> list (list (key * α)).
Axiom view : forall {α : Type} `{Inhabited α}, t α -> key -> option α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t α), 0%Z < Z.of_nat (length (data self)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (data self)) -> good_hash (data self) i) ∧ (∀(k : key) (v : α), good_data k v (view self) (data self)).
Definition t'eq {α : Type} `{Inhabited α} (a : t α) (b : t α) := size a = size b ∧ data a = data b ∧ view a = view b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t α) (b : t α) (fact0 : t'eq a b), a = b.
Theorem clear'vc {α : Type} `{Inhabited α} (h : t α) : let o1 : Z := Z.of_nat (length (data h)) in (0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ 0%Z + o1 ≤ Z.of_nat (length (data h))) ∧ (∀(h_data : list (list (key * α))), length h_data = length (data h) -> length h_data = length (data h) -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ 0%Z + o1 ≤ i ∧ i < Z.of_nat (length h_data) -> nth (Z.to_nat i) h_data inhabitant = nth (Z.to_nat i) (data h) inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z + o1 -> nth (Z.to_nat i) h_data inhabitant = ([] : list (key * α))) -> (∀(h1 : t α), (0%Z < Z.of_nat (length h_data) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length h_data) -> good_hash h_data i) ∧ (∀(k : key) (v : α), good_data k v ((const : option α -> key -> option α) (None : option α)) h_data)) ∧ ((const : option α -> key -> option α) (None : option α) = view h1 ∧ h_data = data h1 ∧ 0%Z = size h1 -> view h1 = (const : option α -> key -> option α) (None : option α)))).
Admitted.
