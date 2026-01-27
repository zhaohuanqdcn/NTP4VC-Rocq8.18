import Why3.Base
import pearl.snapshotable_trees_vcg.lean.snapshotable_trees.Tree
open Classical
open Lean4Why3
namespace snapshotable_trees_BSTree_bst_addqtvc
noncomputable def lt_tree (x : ℤ) (t : Tree.tree) := ∀(y : ℤ), Tree.mem y t → y < x
noncomputable def gt_tree (x : ℤ) (t : Tree.tree) := ∀(y : ℤ), Tree.mem y t → x < y
noncomputable def bst : Tree.tree -> Prop
  | (Tree.tree.Empty : Tree.tree) => True
  | (Tree.tree.Node l x r) => bst l ∧ bst r ∧ lt_tree x l ∧ gt_tree x r
theorem bst_add'vc (t : Tree.tree) (x : ℤ) (fact0 : bst t) : match t with | (Tree.tree.Empty : Tree.tree) => (let result : Tree.tree := Tree.tree.Node (Tree.tree.Empty : Tree.tree) x (Tree.tree.Empty : Tree.tree); bst result ∧ ¬Tree.mem x t ∧ (∀(y : ℤ), Tree.mem y result = (y = x ∨ Tree.mem y t))) | Tree.tree.Node l y r => (if x = y then Tree.mem x t else if x < y then ((match t with | (Tree.tree.Empty : Tree.tree) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ bst l) ∧ (∀(o1 : Tree.tree), bst o1 ∧ ¬Tree.mem x l ∧ (∀(y1 : ℤ), Tree.mem y1 o1 = (y1 = x ∨ Tree.mem y1 l)) → (let result : Tree.tree := Tree.tree.Node o1 y r; bst result ∧ ¬Tree.mem x t ∧ (∀(y1 : ℤ), Tree.mem y1 result = (y1 = x ∨ Tree.mem y1 t)))) ∧ (Tree.mem x l → Tree.mem x t) else ((match t with | (Tree.tree.Empty : Tree.tree) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ bst r) ∧ (∀(o1 : Tree.tree), bst o1 ∧ ¬Tree.mem x r ∧ (∀(y1 : ℤ), Tree.mem y1 o1 = (y1 = x ∨ Tree.mem y1 r)) → (let result : Tree.tree := Tree.tree.Node l y o1; bst result ∧ ¬Tree.mem x t ∧ (∀(y1 : ℤ), Tree.mem y1 result = (y1 = x ∨ Tree.mem y1 t)))) ∧ (Tree.mem x r → Tree.mem x t))
  := sorry
end snapshotable_trees_BSTree_bst_addqtvc
