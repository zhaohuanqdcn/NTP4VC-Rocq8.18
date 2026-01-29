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
Open Scope Z_scope.
Axiom graph : Type.
Axiom graph_inhabited : Inhabited graph.
Global Existing Instance graph_inhabited.
Axiom graph_countable : Countable graph.
Global Existing Instance graph_countable.
Inductive path : graph -> Z -> Z -> Prop :=
 | Path_refl (g : graph) (x : Z) : path g x x
 | Path_sym (g : graph) (x : Z) (y : Z) : path g x y -> path g y x
 | Path_trans (g : graph) (x : Z) (y : Z) (z : Z) : path g x y -> path g y z -> path g x z.
