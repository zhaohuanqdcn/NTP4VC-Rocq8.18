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
Theorem t'vc {α : Type} `{Inhabited α} : 0%Z ≤ 1%Z ∧ (∀(o1 : list (list (key * α))), (∀(i : Z), 0%Z ≤ i ∧ i < 1%Z -> nth (Z.to_nat i) o1 inhabitant = ([] : list (key * α))) ∧ Z.of_nat (length o1) = 1%Z -> 0%Z < Z.of_nat (length o1) ∧ (0%Z < Z.of_nat (length o1) -> (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o1) -> good_hash o1 i) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o1) -> good_hash o1 i) -> (∀(k : key) (v : α), good_data k v ((const : option α -> key -> option α) (None : option α)) o1)))).
Proof.
Admitted.
