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
Require Import snapshotable_trees_vcg.snapshotable_trees.Tree.
Require Import snapshotable_trees_vcg.snapshotable_trees.MyEnum.
Open Scope Z_scope.
Inductive iterator :=
  | iterator'mk : enum -> iterator.
Axiom iterator_inhabited : Inhabited iterator.
Global Existing Instance iterator_inhabited.
Axiom iterator_countable : Countable iterator.
Global Existing Instance iterator_countable.
Definition it (x : iterator) := match x with |  iterator'mk a => a end.
Definition elements (i : iterator) : list Z := enum_elements (it i).
Definition hasNext (i : iterator) := ¬ it i = Done.
Theorem next'vc (i : enum) : let i1 : iterator := iterator'mk i in hasNext i1 -> (match i with | Done => False | Next x r e => (∀(o1 : enum), enum_elements o1 = tree_elements r ++ enum_elements e -> elements i1 = cons x (elements (iterator'mk o1))) end).
Admitted.
