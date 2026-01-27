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
Open Scope Z_scope.
Inductive enum :=
  | Done : enum
  | Next : Z -> tree -> enum -> enum.
Axiom enum_inhabited : Inhabited enum.
Global Existing Instance enum_inhabited.
Axiom enum_countable : Countable enum.
Global Existing Instance enum_countable.
Program Fixpoint enum_elements (e : enum) : list Z :=
match e with | Done => ([] : list Z) | Next x r e1 => cons x (tree_elements r ++ enum_elements e1) end.
Admit Obligations.
Theorem enum'vc (t : tree) (e : enum) : (match t with | Empty => True | Node l x r => (match t with | Empty => False | Node f _ f1 => f = l ∨ f1 = l end) end) ∧ (∀(result : enum), (match t with | Empty => result = e | Node l x r => enum_elements result = tree_elements l ++ enum_elements (Next x r e) end) -> enum_elements result = tree_elements t ++ enum_elements e).
Admitted.
