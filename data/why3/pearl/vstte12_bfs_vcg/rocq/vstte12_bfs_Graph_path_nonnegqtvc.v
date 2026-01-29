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
Theorem path_nonneg'vc (v1 : vertex) (v2 : vertex) (n : Z) (fact0 : path v1 v2 n) : 0%Z ≤ n.
Proof.
Admitted.
