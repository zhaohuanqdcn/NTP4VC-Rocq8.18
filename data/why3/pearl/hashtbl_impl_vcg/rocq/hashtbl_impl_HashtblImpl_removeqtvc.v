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
Theorem remove'vc {α : Type} `{Inhabited α} (h : t α) (k : key) : let o1 : Z := Z.of_nat (length (data h)) in 0%Z < o1 ∧ (let i : Z := bucket k o1 in 0%Z ≤ i ∧ i < o1 -> (let o2 : list (list (key * α)) := data h in (0%Z ≤ i ∧ i < Z.of_nat (length o2)) ∧ (let l : list (key * α) := nth (Z.to_nat i) o2 inhabitant in ∀(o3 : option α), (match o3 with | None => (∀(v : α), ¬ (k, v) ∈ l) | Some v => (k, v) ∈ l end) -> (match o3 with | None => view h k = (None : option α) | Some _ => (∀(o4 : list (key * α)), (∀(k' : key) (v : α), ((k', v) ∈ o4) = ((k', v) ∈ l ∧ ¬ k' = k)) -> (let o5 : list (list (key * α)) := data h in (0%Z ≤ i ∧ i < Z.of_nat (length o5)) ∧ (length (set_list o5 (Z.to_nat i) o4) = length o5 -> length (set_list o5 (Z.to_nat i) o4) = length (data h) -> nth_i (set_list o5 (Z.to_nat i) o4) = fun_updt (nth_i o5) i o4 -> (∀(h1 : t α), (0%Z < Z.of_nat (length (set_list o5 (Z.to_nat i) o4)) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < Z.of_nat (length (set_list o5 (Z.to_nat i) o4)) -> good_hash (set_list o5 (Z.to_nat i) o4) i1) ∧ (∀(k1 : key) (v : α), good_data k1 v (fun_updt (view h) k (None : option α)) (set_list o5 (Z.to_nat i) o4))) ∧ (fun_updt (view h) k (None : option α) = view h1 ∧ set_list o5 (Z.to_nat i) o4 = data h1 ∧ size h - 1%Z = size h1 -> view h1 k = (None : option α) ∧ (∀(k' : key), ¬ k' = k -> view h1 k' = view h k')))))) end)))).
Proof.
Admitted.
