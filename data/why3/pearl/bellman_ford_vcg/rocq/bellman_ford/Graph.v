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
Axiom vertex : Type.
Axiom vertex_inhabited : Inhabited vertex.
Global Existing Instance vertex_inhabited.
Axiom vertex_countable : Countable vertex.
Global Existing Instance vertex_countable.
Axiom vertices : gset vertex.
Axiom edges : gset (vertex * vertex).
Definition edge (x : vertex) (y : vertex) := (x, y) ∈ edges.
Axiom edges_def : forall  (x : vertex) (y : vertex) (fact0 : (x, y) ∈ edges), x ∈ vertices ∧ y ∈ vertices.
Axiom s : vertex.
Axiom s'def : s ∈ vertices.
Inductive path : vertex -> list vertex -> vertex -> Prop :=
 | Path_empty (x : vertex) : path x ([] : list vertex) x
 | Path_cons (x : vertex) (y : vertex) (l : list vertex) (z : vertex) : edge x y -> path y l z -> path x (cons x l) z.
Axiom path_right_extension : forall  (x : vertex) (l : list vertex) (y : vertex) (z : vertex) (fact0 : path x l y) (fact1 : edge y z), path x (l ++ cons y ([] : list vertex)) z.
Axiom path_right_inversion : forall  (x : vertex) (l : list vertex) (z : vertex) (fact0 : path x l z), x = z ∧ l = ([] : list vertex) ∨ (∃(y : vertex) (l' : list vertex), path x l' y ∧ edge y z ∧ l = l' ++ cons y ([] : list vertex)).
Axiom path_trans : forall  (x : vertex) (l1 : list vertex) (y : vertex) (l2 : list vertex) (z : vertex) (fact0 : path x l1 y) (fact1 : path y l2 z), path x (l1 ++ l2) z.
Axiom empty_path : forall  (x : vertex) (y : vertex) (fact0 : path x ([] : list vertex) y), x = y.
Axiom path_decomposition : forall  (x : vertex) (l1 : list vertex) (y : vertex) (l2 : list vertex) (z : vertex) (fact0 : path x (l1 ++ cons y l2) z), path x l1 y ∧ path y (cons y l2) z.
Axiom weight : vertex -> vertex -> Z.
Axiom path_weight : list vertex -> vertex -> Z.
Axiom path_weight_def : forall (l : list vertex) (dst : vertex), path_weight l dst = (match l with | [] => 0%Z | cons x [] => weight x dst | cons x (cons y _ as r) => weight x y + path_weight r dst end).
Axiom path_weight_right_extension : forall  (l : list vertex) (x : vertex) (y : vertex), path_weight (l ++ cons x ([] : list vertex)) y = path_weight l x + weight x y.
Axiom path_weight_decomposition : forall  (l1 : list vertex) (y : vertex) (l2 : list vertex) (z : vertex), path_weight (l1 ++ cons y l2) z = path_weight l1 y + path_weight (cons y l2) z.
Definition pigeon_set (s1 : gset vertex) := ∀(l : list vertex), (∀(e : vertex), e ∈ l -> e ∈ s1) -> Z.of_nat (size s1) < Z.of_nat (length l) -> (∃(e : vertex) (l1 : list vertex) (l2 : list vertex) (l3 : list vertex), l = l1 ++ cons e (l2 ++ cons e l3)).
Axiom Induction : forall  (s1 : gset vertex) (fact0 : ∀(s1 : gset vertex), s1 = ∅ -> pigeon_set s1) (fact1 : ∀(s1 : gset vertex), pigeon_set s1 -> (∀(t : vertex), pigeon_set (insert_set t s1))), pigeon_set s1.
Axiom corner : forall  (l : list vertex) (s1 : gset vertex) (fact0 : length l = size s1) (fact1 : ∀(e : vertex), e ∈ l -> e ∈ s1), (∃(e : vertex) (l1 : list vertex) (l2 : list vertex) (l3 : list vertex), l = l1 ++ cons e (l2 ++ cons e l3)) ∨ (∀(e : vertex), e ∈ s1 -> e ∈ l).
Axiom pigeon_0 : pigeon_set (∅ : gset vertex).
Axiom pigeon_1 : forall  (s1 : gset vertex) (t : vertex) (fact0 : pigeon_set s1), pigeon_set (insert_set t s1).
Axiom pigeon_2 : forall  (s1 : gset vertex), pigeon_set s1.
Axiom pigeonhole : forall  (l : list vertex) (s1 : gset vertex) (fact0 : ∀(e : vertex), e ∈ l -> e ∈ s1) (fact1 : Z.of_nat (size s1) < Z.of_nat (length l)), ∃(e : vertex) (l1 : list vertex) (l2 : list vertex) (l3 : list vertex), l = l1 ++ cons e (l2 ++ cons e l3).
Definition cyc_decomp (v : vertex) (l : list vertex) (vi : vertex) (l1 : list vertex) (l2 : list vertex) (l3 : list vertex) := l = (l1 ++ l2) ++ l3 ∧ 0%Z < Z.of_nat (length l2) ∧ path s l1 vi ∧ path vi l2 vi ∧ path vi l3 v.
Definition negative_cycle (v : vertex) := v ∈ vertices ∧ (∃(l1 : list vertex), path s l1 v) ∧ (∃(l2 : list vertex), path v l2 v ∧ path_weight l2 v < 0%Z).
Definition all_path_gt (v : vertex) (n : Z) := ∀(l : list vertex), path s l v ∧ Z.of_nat (length l) < Z.of_nat (size vertices) -> n ≤ path_weight l v.
