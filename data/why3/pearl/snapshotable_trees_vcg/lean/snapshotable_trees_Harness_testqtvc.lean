import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Iterator
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.BSTree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.ITree
open Classical
open Lean4Why3
namespace snapshotable_trees_Harness_testqtvc
theorem test'vc (t : ITree.itree) (x : Bool) (t1 : ITree.itree) (x_1 : Bool) (t2 : ITree.itree) (x_2 : Bool) (t3 : ITree.itree) (s : ITree.itree) (it : MyEnum.enum) (fact0 : ITree.tree t = (Tree.tree.Empty : Tree.tree)) (fact1 : (x = false) = Tree.mem (1 : ℤ) (ITree.tree t)) (fact2 : ∀(y : ℤ), Tree.mem y (ITree.tree t1) = (y = (1 : ℤ) ∨ Tree.mem y (ITree.tree t))) (fact3 : (x_1 = false) = Tree.mem (2 : ℤ) (ITree.tree t1)) (fact4 : ∀(y : ℤ), Tree.mem y (ITree.tree t2) = (y = (2 : ℤ) ∨ Tree.mem y (ITree.tree t1))) (fact5 : (x_2 = false) = Tree.mem (3 : ℤ) (ITree.tree t2)) (fact6 : ∀(y : ℤ), Tree.mem y (ITree.tree t3) = (y = (3 : ℤ) ∨ Tree.mem y (ITree.tree t2))) (fact7 : ITree.tree s = ITree.tree t3) (fact8 : Iterator.elements (Iterator.iterator.mk it) = Tree.tree_elements (ITree.tree s)) : BSTree.bst (ITree.tree t3) ∧ (∀(it1 : MyEnum.enum) (t4 : ITree.itree) (t_tree : Tree.tree), let it2 : Iterator.iterator := Iterator.iterator.mk it1; BSTree.bst t_tree → Iterator.hasNext it2 → Iterator.hasNext it2 ∧ (∀(it3 : MyEnum.enum), let it4 : Iterator.iterator := Iterator.iterator.mk it3; ∀(x : ℤ), Iterator.elements it2 = List.cons x (Iterator.elements it4) → (let o1 : ℤ := x * (3 : ℤ); BSTree.bst t_tree ∧ (t_tree = ITree.tree t4 → (∀(t5 : ITree.itree) (x_3 : Bool), (x_3 = false) = Tree.mem o1 (ITree.tree t4) ∧ (∀(y : ℤ), Tree.mem y (ITree.tree t5) = (y = o1 ∨ Tree.mem y (ITree.tree t4))) → ((0 : ℤ) ≤ Int.ofNat (List.length (Iterator.elements it2)) ∧ List.length (Iterator.elements it4) < List.length (Iterator.elements it2)) ∧ BSTree.bst (ITree.tree t5))))))
  := sorry
end snapshotable_trees_Harness_testqtvc
