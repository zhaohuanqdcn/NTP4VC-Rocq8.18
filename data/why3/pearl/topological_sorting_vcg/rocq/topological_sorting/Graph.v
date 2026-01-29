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
Axiom graph : Type.
Axiom graph_inhabited : Inhabited graph.
Global Existing Instance graph_inhabited.
Axiom graph_countable : Countable graph.
Global Existing Instance graph_countable.
Axiom vertices : graph -> gset vertex.
Axiom edges : graph -> gset (vertex * vertex).
Axiom edges_use_vertices : forall  (x : vertex) (y : vertex) (g : graph) (fact0 : (x, y) ∈ edges g), x ∈ vertices g ∧ y ∈ vertices g.
Axiom preds : graph -> vertex -> gset vertex.
Axiom preds_def : forall  (u : vertex) (v : vertex) (g : graph), ((u, v) ∈ edges g) = (u ∈ preds g v).
Axiom succs : graph -> vertex -> gset vertex.
Axiom succs_def : forall  (u : vertex) (v : vertex) (g : graph), ((u, v) ∈ edges g) = (v ∈ succs g u).
Axiom msort : Type.
Axiom msort_inhabited : Inhabited msort.
Global Existing Instance msort_inhabited.
Axiom msort_countable : Countable msort.
Global Existing Instance msort_countable.
Definition sort (g : graph) (m : vertex -> Z) := ∀(v : vertex) (u : vertex), (u, v) ∈ edges g -> m u < m v.
