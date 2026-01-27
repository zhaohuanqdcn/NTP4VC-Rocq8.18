import Why3.Base
open Classical
open Lean4Why3
namespace vacid_0_red_black_trees_RedBlackTree_bst_Leafqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom value : Type
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
inductive color where
  | Red : color
  | Black : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
inductive tree where
  | Leaf : tree
  | Node : color -> tree -> ℤ -> ℤ -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def memt : tree -> ℤ -> ℤ -> Prop
  | tree.Leaf, k, v => False
  | (tree.Node x l k' v' r), k, v => k = k' ∧ v = v' ∨ memt l k v ∨ memt r k v
noncomputable def lt_tree (x : ℤ) (t : tree) := ∀(k : ℤ) (v : ℤ), memt t k v → k < x
noncomputable def gt_tree (x : ℤ) (t : tree) := ∀(k : ℤ) (v : ℤ), memt t k v → x < k
noncomputable def bst : tree -> Prop
  | tree.Leaf => True
  | (tree.Node x l k x0 r) => bst l ∧ bst r ∧ lt_tree k l ∧ gt_tree k r
theorem bst_Leaf'vc : bst tree.Leaf
  := sorry
end vacid_0_red_black_trees_RedBlackTree_bst_Leafqtvc
