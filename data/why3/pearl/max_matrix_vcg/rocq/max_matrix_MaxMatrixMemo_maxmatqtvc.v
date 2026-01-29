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
Require Import Why3.map.Const.
Require Import max_matrix_vcg.max_matrix.Bitset.
Require Import max_matrix_vcg.max_matrix.HashTable.
Open Scope Z_scope.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom contents : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom create : forall {α : Type} `{Inhabited α}, α -> t α.
Axiom create'spec : forall  {α : Type} `{Inhabited α} (x : α), contents (create x) = (const : α -> Z -> α) x.
Axiom mixfix_lbrb : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom mixfix_lbrb'spec : forall  {α : Type} `{Inhabited α} (m : t α) (k : Z), mixfix_lbrb m k = contents m k.
Axiom mixfix_lblsmnrb : forall {α : Type} `{Inhabited α}, t α -> Z -> α -> t α.
Axiom mixfix_lblsmnrb'spec : forall  {α : Type} `{Inhabited α} (m : t α) (k : Z) (v : α), contents (mixfix_lblsmnrb m k v) = fun_updt (contents m) k v.
Axiom n : Z.
Axiom n'def : 0%Z ≤ n ∧ n ≤ Bitset.size.
Axiom m : t (t Z).
Axiom m'def : forall  (i : Z) (j : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n) (fact2 : 0%Z ≤ j) (fact3 : j < n), 0%Z ≤ mixfix_lbrb (mixfix_lbrb m i) j.
Axiom mapii : Type.
Axiom mapii_inhabited : Inhabited mapii.
Global Existing Instance mapii_inhabited.
Axiom mapii_countable : Countable mapii.
Global Existing Instance mapii_countable.
Definition solution (s : Z -> Z) (i : Z) := (∀(k : Z), i ≤ k ∧ k < n -> 0%Z ≤ s k ∧ s k < n) ∧ (∀(k1 : Z) (k2 : Z), i ≤ k1 ∧ k1 < k2 ∧ k2 < n -> ¬ s k1 = s k2).
Definition f (s : Z -> Z) (i : Z) : Z := mixfix_lbrb (mixfix_lbrb m i) (s i).
Axiom sum : (Z -> Z) -> Z -> Z -> Z.
Axiom Sum_def_empty : forall  (j : Z) (i : Z) (c : Z -> Z) (fact0 : j ≤ i), sum c i j = 0%Z.
Axiom Sum_def_non_empty : forall  (i : Z) (j : Z) (c : Z -> Z) (fact0 : i < j), sum c i j = f c i + sum c (i + 1%Z) j.
Axiom Sum_right_extension : forall  (i : Z) (j : Z) (c : Z -> Z) (fact0 : i < j), sum c i j = sum c i (j - 1%Z) + f c (j - 1%Z).
Axiom Sum_transitivity : forall  (i : Z) (k : Z) (j : Z) (c : Z -> Z) (fact0 : i ≤ k) (fact1 : k ≤ j), sum c i j = sum c i k + sum c k j.
Axiom Sum_eq : forall  (i : Z) (j : Z) (c1 : Z -> Z) (c2 : Z -> Z) (fact0 : ∀(k : Z), i ≤ k ∧ k < j -> f c1 k = f c2 k), sum c1 i j = sum c2 i j.
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom value : Type.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Definition pre (k : Z * set) := match k with | (i, c) => (0%Z ≤ i ∧ i ≤ n) ∧ cardinal c = n - i ∧ (∀(k1 : Z), mem k1 c -> 0%Z ≤ k1 ∧ k1 < n) end.
Definition post (k : Z * set) (v : Z * t Z) := match k with | (i, c) => (match v with | (r, sol) => 0%Z ≤ r ∧ solution (contents sol) i ∧ (∀(k1 : Z), i ≤ k1 ∧ k1 < n -> mem (mixfix_lbrb sol k1) c) ∧ r = sum (contents sol) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k1 : Z), i ≤ k1 ∧ k1 < n -> mem (s k1) c) -> sum s i n ≤ r) end) end.
Axiom table : Type.
Axiom table_inhabited : Inhabited table.
Global Existing Instance table_inhabited.
Axiom table_countable : Countable table.
Global Existing Instance table_countable.
Definition inv (t1 : HashTable.t (Z * set) (Z * t Z)) := ∀(k : Z * set) (v : Z * t Z), HashTable.mixfix_lbrb t1 k = Some v -> post k v.
Theorem maxmat'vc (table1 : HashTable.t (Z * set) (Z * t Z)) (fact0 : ∀(k : Z * set), HashTable.mixfix_lbrb table1 k = None) : let o1 : Z := n in (0%Z ≤ o1 ∧ o1 ≤ Bitset.size) ∧ (let o2 : set := below o1 in (∀(x : Z), mem x o2 = (0%Z ≤ x ∧ x < o1)) -> (pre (0%Z, o2) ∧ inv table1) ∧ (∀(table2 : HashTable.t (Z * set) (Z * t Z)) (o3 : Z) (o4 : t Z), post (0%Z, o2) (o3, o4) ∧ inv table2 -> (∃(s : Z -> Z), solution s 0%Z ∧ o3 = sum s 0%Z n) ∧ (∀(s : Z -> Z), solution s 0%Z -> sum s 0%Z n ≤ o3))).
Proof.
Admitted.
