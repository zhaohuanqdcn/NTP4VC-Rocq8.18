import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
open Classical
open Lean4Why3
namespace snapshotable_trees_BSTree_bst_memqtvc
noncomputable def lt_tree (x : ℤ) (t : Tree.tree) := ∀(y : ℤ), Tree.mem y t → y < x
noncomputable def gt_tree (x : ℤ) (t : Tree.tree) := ∀(y : ℤ), Tree.mem y t → x < y
noncomputable def bst : Tree.tree -> Prop
  | (Tree.tree.Empty : Tree.tree) => True
  | (Tree.tree.Node l x r) => bst l ∧ bst r ∧ lt_tree x l ∧ gt_tree x r
theorem bst_mem'vc (t : Tree.tree) (x : ℤ) (fact0 : bst t) : (match t with | (Tree.tree.Empty : Tree.tree) => True | Tree.tree.Node l y r => (if x < y then (match t with | (Tree.tree.Empty : Tree.tree) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ bst l else ¬x = y → (match t with | (Tree.tree.Empty : Tree.tree) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ bst r)) ∧ (∀(result : Bool), (match t with | (Tree.tree.Empty : Tree.tree) => result = false | Tree.tree.Node l y r => (if x < y then result = (if Tree.mem x l then true else false) else if x = y then result = true else result = (if Tree.mem x r then true else false))) → (result = true) = Tree.mem x t)
  := sorry
end snapshotable_trees_BSTree_bst_memqtvc
