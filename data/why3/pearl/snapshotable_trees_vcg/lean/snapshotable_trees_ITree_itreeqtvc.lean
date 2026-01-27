import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Iterator
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.BSTree
open Classical
open Lean4Why3
namespace snapshotable_trees_ITree_itreeqtvc
theorem itree'vc : ∃(tree : Tree.tree), BSTree.bst tree
  := sorry
end snapshotable_trees_ITree_itreeqtvc
