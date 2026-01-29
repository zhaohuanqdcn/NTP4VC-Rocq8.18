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
Theorem create_iterator'vc (o1 : enum) (t : tree) (fact0 : enum_elements o1 = tree_elements t ++ enum_elements Done) : elements (iterator'mk o1) = tree_elements t.
Proof.
Admitted.
