import Why3.Base
open Classical
open Lean4Why3
namespace vacid_0_red_black_trees_RedBlackTree_findqtvc
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
noncomputable def is_not_red (t : tree) := match t with | tree.Node color.Red _ _ _ _ => False | tree.Leaf => True | tree.Node color.Black _ _ _ _ => True
noncomputable def rbtree : ℤ -> tree -> Prop
  | n, tree.Leaf => n = (0 : ℤ)
  | n, (tree.Node color.Red l x x0 r) => rbtree n l ∧ rbtree n r ∧ is_not_red l ∧ is_not_red r
  | n, (tree.Node color.Black l x x0 r) => rbtree (n - (1 : ℤ)) l ∧ rbtree (n - (1 : ℤ)) r
theorem find'vc (t : tree) (k : ℤ) (fact0 : bst t) : match t with | tree.Leaf => (∀(v : ℤ), ¬memt t k v) | tree.Node _ l k' v r => (if k = k' then memt t k v else if k < k' then ((match t with | tree.Leaf => False | tree.Node _ f _ _ f1 => f = l ∨ f1 = l) ∧ bst l) ∧ (∀(result : ℤ), memt l k result → memt t k result) ∧ ((∀(v1 : ℤ), ¬memt l k v1) → (∀(v1 : ℤ), ¬memt t k v1)) else ((match t with | tree.Leaf => False | tree.Node _ f _ _ f1 => f = r ∨ f1 = r) ∧ bst r) ∧ (∀(result : ℤ), memt r k result → memt t k result) ∧ ((∀(v1 : ℤ), ¬memt r k v1) → (∀(v1 : ℤ), ¬memt t k v1)))
  := sorry
end vacid_0_red_black_trees_RedBlackTree_findqtvc
