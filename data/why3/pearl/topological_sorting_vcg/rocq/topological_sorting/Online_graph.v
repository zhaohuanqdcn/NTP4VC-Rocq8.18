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
Require Import topological_sorting_vcg.topological_sorting.Graph.
Open Scope Z_scope.
Axiom add_edge : graph -> vertex -> vertex -> graph.
Axiom add_edge'spec'0 : forall  (g : graph) (u : vertex) (v : vertex) (x : vertex), preds (add_edge g u v) x = (if decide (x = v) then insert_set u (preds g v) else preds g x).
Axiom add_edge'spec : forall  (g : graph) (u : vertex) (v : vertex) (x : vertex), succs (add_edge g u v) x = (if decide (x = u) then insert_set v (succs g u) else succs g x).
