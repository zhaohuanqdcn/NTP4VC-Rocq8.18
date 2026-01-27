import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.MyEnum
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Iterator
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.BSTree
open Classical
open Lean4Why3
namespace snapshotable_trees_ITree_addqtvc
axiom itree : Type
axiom inhabited_axiom_itree : Inhabited itree
attribute [instance] inhabited_axiom_itree
axiom tree : itree -> Tree.tree
axiom itree'invariant (self : itree) : BSTree.bst (tree self)
noncomputable def itree'eq (a : itree) (b : itree) := tree a = tree b
axiom itree'inj (a : itree) (b : itree) (fact0 : itree'eq a b) : a = b
theorem add'vc (t : itree) (x : ℤ) : let o1 : Tree.tree := tree t; BSTree.bst o1 ∧ (∀(o2 : Tree.tree), BSTree.bst o2 ∧ ¬Tree.mem x o1 ∧ (∀(y : ℤ), Tree.mem y o2 = (y = x ∨ Tree.mem y o1)) → (∀(t1 : itree), BSTree.bst o2 ∧ (o2 = tree t1 → ¬Tree.mem x (tree t) ∧ (∀(y : ℤ), Tree.mem y (tree t1) = (y = x ∨ Tree.mem y (tree t)))))) ∧ (Tree.mem x o1 → Tree.mem x (tree t) ∧ (∀(y : ℤ), Tree.mem y (tree t) = (y = x ∨ Tree.mem y (tree t))))
  := sorry
end snapshotable_trees_ITree_addqtvc
