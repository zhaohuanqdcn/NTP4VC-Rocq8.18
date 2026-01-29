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
Program Fixpoint mem_forest (n : Z) (f : forest) : Prop :=
match f with | E => False | N i f1 f2 => i = n ∨ mem_forest n f1 ∨ mem_forest n f2 end.
Admit Obligations.
Definition between_range_forest (i : Z) (j : Z) (f : forest) := ∀(n : Z), mem_forest n f -> i ≤ n ∧ n < j.
Definition disjoint (f1 : forest) (f2 : forest) := ∀(x : Z), mem_forest x f1 -> ¬ mem_forest x f2.
Program Fixpoint no_repeated_forest (f : forest) : Prop :=
match f with | E => True | N i f1 f2 => no_repeated_forest f1 ∧ no_repeated_forest f2 ∧ ¬ mem_forest i f1 ∧ ¬ mem_forest i f2 ∧ disjoint f1 f2 end.
Admit Obligations.
Definition valid_nums_forest (f : forest) (n : Z) := between_range_forest 0%Z n f ∧ no_repeated_forest f.
Program Fixpoint white_forest (f : forest) (c : Z -> color) : Prop :=
match f with | E => True | N i f1 f2 => c i = White ∧ white_forest f1 c ∧ white_forest f2 c end.
Admit Obligations.
Program Fixpoint valid_coloring (f : forest) (c : Z -> color) : Prop :=
match f with | E => True | N i f1 f2 => valid_coloring f2 c ∧ (match c i with | White => white_forest f1 c | Black => valid_coloring f1 c end) end.
Admit Obligations.
Program Fixpoint count_forest (f : forest) : Z :=
match f with | E => 1%Z | N _ f1 f2 => (1%Z + count_forest f1) * count_forest f2 end.
Admit Obligations.
Definition eq_coloring (n : Z) (c1 : Z -> color) (c2 : Z -> color) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> c1 i = c2 i.
