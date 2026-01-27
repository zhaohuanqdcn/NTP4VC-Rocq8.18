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
Require Import snapshotable_trees_vcg.snapshotable_trees.ITree.
Open Scope Z_scope.
Theorem test'vc (t : itree) (x : bool) (t1 : itree) (x_1 : bool) (t2 : itree) (x_2 : bool) (t3 : itree) (s : itree) (it : enum) (fact0 : ITree.tree t = (Empty : Tree.tree)) (fact1 : (x = false) = mem 1%Z (ITree.tree t)) (fact2 : ∀(y : Z), mem y (ITree.tree t1) = (y = 1%Z ∨ mem y (ITree.tree t))) (fact3 : (x_1 = false) = mem 2%Z (ITree.tree t1)) (fact4 : ∀(y : Z), mem y (ITree.tree t2) = (y = 2%Z ∨ mem y (ITree.tree t1))) (fact5 : (x_2 = false) = mem 3%Z (ITree.tree t2)) (fact6 : ∀(y : Z), mem y (ITree.tree t3) = (y = 3%Z ∨ mem y (ITree.tree t2))) (fact7 : ITree.tree s = ITree.tree t3) (fact8 : elements (iterator'mk it) = tree_elements (ITree.tree s)) : bst (ITree.tree t3) ∧ (∀(it1 : enum) (t4 : itree) (t_tree : Tree.tree), let it2 : iterator := iterator'mk it1 in bst t_tree -> hasNext it2 -> hasNext it2 ∧ (∀(it3 : enum), let it4 : iterator := iterator'mk it3 in ∀(x : Z), elements it2 = cons x (elements it4) -> (let o1 : Z := x * 3%Z in bst t_tree ∧ (t_tree = ITree.tree t4 -> (∀(t5 : itree) (x_3 : bool), (x_3 = false) = mem o1 (ITree.tree t4) ∧ (∀(y : Z), mem y (ITree.tree t5) = (y = o1 ∨ mem y (ITree.tree t4))) -> (0%Z ≤ Z.of_nat (length (elements it2)) ∧ Z.of_nat (length (elements it4)) < Z.of_nat (length (elements it2))) ∧ bst (ITree.tree t5)))))).
Admitted.
