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
Theorem resize'vc {α : Type} `{Inhabited α} (h : t α) : let odata : list (list (key * α)) := data h in let osize : Z := Z.of_nat (length odata) in let nsize : Z := 2%Z * osize + 1%Z in 0%Z ≤ nsize ∧ (∀(ndata : list (list (key * α))), (∀(i : Z), 0%Z ≤ i ∧ i < nsize -> nth (Z.to_nat i) ndata inhabitant = ([] : list (key * α))) ∧ Z.of_nat (length ndata) = nsize -> (∀(ndata1 : list (list (key * α))) (h1 : t α), length ndata1 = length ndata -> (∀(i : Z) (l : list (key * α)), (view h = view h1 ∧ size h = size h1) ∧ (∀(k : key) (v : α), (k, v) ∈ l -> bucket k osize = i) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata1 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize < i) then good_data k v (view h1) ndata1 else if decide (bucket k osize = i) then (view h1 k = Some v) = ((k, v) ∈ l ∨ in_data k v ndata1) else ¬ in_data k v ndata1) -> (match l with | [] => (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata1 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize ≤ i) then good_data k v (view h1) ndata1 else ¬ in_data k v ndata1) | cons (k, v) r => 0%Z < nsize ∧ (let b : Z := bucket k nsize in 0%Z ≤ b ∧ b < nsize -> (0%Z ≤ b ∧ b < Z.of_nat (length ndata1)) ∧ (let o1 : list (key * α) := cons (k, v) (nth (Z.to_nat b) ndata1 inhabitant) in (0%Z ≤ b ∧ b < Z.of_nat (length ndata1)) ∧ (length (set_list ndata1 (Z.to_nat b) o1) = length ndata1 -> nth_i (set_list ndata1 (Z.to_nat b) o1) = fun_updt (nth_i ndata1) b o1 -> (match l with | [] => False | cons _ f => f = r end) ∧ (∀(k1 : key) (v1 : α), (k1, v1) ∈ r -> bucket k1 osize = i) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash (set_list ndata1 (Z.to_nat b) o1) j) ∧ (∀(k1 : key) (v1 : α), if decide (0%Z ≤ bucket k1 osize ∧ bucket k1 osize < i) then good_data k1 v1 (view h1) (set_list ndata1 (Z.to_nat b) o1) else if decide (bucket k1 osize = i) then (view h1 k1 = Some v1) = ((k1, v1) ∈ r ∨ in_data k1 v1 (set_list ndata1 (Z.to_nat b) o1)) else ¬ in_data k1 v1 (set_list ndata1 (Z.to_nat b) o1))))) end))) ∧ (let o1 : Z := osize - 1%Z in (0%Z ≤ o1 + 1%Z -> ((∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize < 0%Z) then good_data k v (view h) ndata else ¬ in_data k v ndata)) ∧ (∀(ndata1 : list (list (key * α))), length ndata1 = length ndata -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata1 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize < i) then good_data k v (view h) ndata1 else ¬ in_data k v ndata1) -> (0%Z ≤ i ∧ i < Z.of_nat (length odata)) ∧ (let o2 : list (key * α) := nth (Z.to_nat i) odata inhabitant in ((∀(k : key) (v : α), (k, v) ∈ o2 -> bucket k osize = i) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata1 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize < i) then good_data k v (view h) ndata1 else if decide (bucket k osize = i) then (view h k = Some v) = ((k, v) ∈ o2 ∨ in_data k v ndata1) else ¬ in_data k v ndata1)) ∧ (∀(ndata2 : list (list (key * α))), length ndata2 = length ndata1 -> (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata2 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize ≤ i) then good_data k v (view h) ndata2 else ¬ in_data k v ndata2) -> (∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata2 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize < i + 1%Z) then good_data k v (view h) ndata2 else ¬ in_data k v ndata2)))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < nsize -> good_hash ndata1 j) ∧ (∀(k : key) (v : α), if decide (0%Z ≤ bucket k osize ∧ bucket k osize < o1 + 1%Z) then good_data k v (view h) ndata1 else ¬ in_data k v ndata1) -> 0%Z < Z.of_nat (length ndata1) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length ndata1) -> good_hash ndata1 i) ∧ (∀(k : key) (v : α), good_data k v (view h) ndata1)))) ∧ (o1 + 1%Z < 0%Z -> 0%Z < Z.of_nat (length ndata) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length ndata) -> good_hash ndata i) ∧ (∀(k : key) (v : α), good_data k v (view h) ndata)))).
Admitted.
