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
Definition lt_tree (x : Z) (t : tree) := ∀(y : Z), mem y t -> y < x.
Definition gt_tree (x : Z) (t : tree) := ∀(y : Z), mem y t -> x < y.
Program Fixpoint bst (t : tree) : Prop :=
match t with | Empty => True | Node l x r => bst l ∧ bst r ∧ lt_tree x l ∧ gt_tree x r end.
Admit Obligations.
Theorem bst_add'vc (t : tree) (x : Z) (fact0 : bst t) : match t with | Empty => (let result : tree := Node (Empty : tree) x (Empty : tree) in bst result ∧ ¬ mem x t ∧ (∀(y : Z), mem y result = (y = x ∨ mem y t))) | Node l y r => (if decide (x = y) then mem x t else if decide (x < y) then ((match t with | Empty => False | Node f _ f1 => f = l ∨ f1 = l end) ∧ bst l) ∧ (∀(o1 : tree), bst o1 ∧ ¬ mem x l ∧ (∀(y1 : Z), mem y1 o1 = (y1 = x ∨ mem y1 l)) -> (let result : tree := Node o1 y r in bst result ∧ ¬ mem x t ∧ (∀(y1 : Z), mem y1 result = (y1 = x ∨ mem y1 t)))) ∧ (mem x l -> mem x t) else ((match t with | Empty => False | Node f _ f1 => f = r ∨ f1 = r end) ∧ bst r) ∧ (∀(o1 : tree), bst o1 ∧ ¬ mem x r ∧ (∀(y1 : Z), mem y1 o1 = (y1 = x ∨ mem y1 r)) -> (let result : tree := Node l y o1 in bst result ∧ ¬ mem x t ∧ (∀(y1 : Z), mem y1 result = (y1 = x ∨ mem y1 t)))) ∧ (mem x r -> mem x t)) end.
Admitted.
