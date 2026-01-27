import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Iterator
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.BSTree
open Classical
open Lean4Why3
namespace snapshotable_trees_ITree_createqtvc
axiom itree : Type
axiom inhabited_axiom_itree : Inhabited itree
attribute [instance] inhabited_axiom_itree
axiom tree : itree -> Tree.tree
axiom itree'invariant (self : itree) : BSTree.bst (tree self)
noncomputable def itree'eq (a : itree) (b : itree) := tree a = tree b
axiom itree'inj (a : itree) (b : itree) (fact0 : itree'eq a b) : a = b
theorem create'vc : BSTree.bst (Tree.tree.Empty : Tree.tree)
  := sorry
end snapshotable_trees_ITree_createqtvc
