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
Inductive color :=
  | White : color
  | Black : color.
Axiom color_inhabited : Inhabited color.
Global Existing Instance color_inhabited.
Axiom color_countable : Countable color.
Global Existing Instance color_countable.
Inductive forest :=
  | E : forest
  | N : Z -> forest -> forest -> forest.
Axiom forest_inhabited : Inhabited forest.
Global Existing Instance forest_inhabited.
Axiom forest_countable : Countable forest.
Global Existing Instance forest_countable.
Axiom coloring : Type.
Axiom coloring_inhabited : Inhabited coloring.
Global Existing Instance coloring_inhabited.
Axiom coloring_countable : Countable coloring.
Global Existing Instance coloring_countable.
Program Fixpoint size_forest (f : forest) : Z :=
match f with | E => 0%Z | N _ f1 f2 => 1%Z + size_forest f1 + size_forest f2 end.
Admit Obligations.
Theorem size_forest_nonneg'vc (f : forest) : 0%Z ≤ size_forest f.
Proof.
Admitted.
