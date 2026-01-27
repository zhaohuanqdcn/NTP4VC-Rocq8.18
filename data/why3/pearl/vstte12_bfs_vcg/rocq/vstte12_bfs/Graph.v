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
Axiom eq : vertex -> vertex -> Prop.
Axiom eq'spec : forall  (x : vertex) (y : vertex), eq x y = (x = y).
Axiom succ : vertex -> gset vertex.
Inductive path : vertex -> vertex -> Z -> Prop :=
 | path_empty (v : vertex) : path v v 0%Z
 | path_succ (v1 : vertex) (v2 : vertex) (n : Z) (v3 : vertex) : path v1 v2 n -> v3 ∈ succ v2 -> path v1 v3 (n + 1%Z).
Definition shortest_path (v1 : vertex) (v2 : vertex) (n : Z) := path v1 v2 n ∧ (∀(m : Z), m < n -> ¬ path v1 v2 m).
