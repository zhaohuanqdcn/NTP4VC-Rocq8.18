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
Require Import snapshotable_trees_vcg.snapshotable_trees.Iterator.
Require Import snapshotable_trees_vcg.snapshotable_trees.BSTree.
Open Scope Z_scope.
Axiom itree : Type.
Axiom itree_inhabited : Inhabited itree.
Global Existing Instance itree_inhabited.
Axiom itree_countable : Countable itree.
Global Existing Instance itree_countable.
Axiom tree : itree -> Tree.tree.
Axiom itree'invariant : forall  (self : itree), bst (tree self).
Definition itree'eq (a : itree) (b : itree) := tree a = tree b.
Axiom itree'inj : forall  (a : itree) (b : itree) (fact0 : itree'eq a b), a = b.
Theorem add'vc (t : itree) (x : Z) : let o1 : Tree.tree := tree t in bst o1 ∧ (∀(o2 : Tree.tree), bst o2 ∧ ¬ mem x o1 ∧ (∀(y : Z), mem y o2 = (y = x ∨ mem y o1)) -> (∀(t1 : itree), bst o2 ∧ (o2 = tree t1 -> ¬ mem x (tree t) ∧ (∀(y : Z), mem y (tree t1) = (y = x ∨ mem y (tree t)))))) ∧ (mem x o1 -> mem x (tree t) ∧ (∀(y : Z), mem y (tree t) = (y = x ∨ mem y (tree t)))).
Admitted.
