import Why3.Base
open Classical
open Lean4Why3
namespace vacid_0_red_black_trees_RedBlackTree_addqtvc
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
noncomputable def almost_rbtree (n : ℤ) (t : tree) := match t with | tree.Leaf => n = (0 : ℤ) | tree.Node color.Red l _ _ r => rbtree n l ∧ rbtree n r | tree.Node color.Black l _ _ r => rbtree (n - (1 : ℤ)) l ∧ rbtree (n - (1 : ℤ)) r
theorem add'vc (t : tree) (k : ℤ) (v : ℤ) (fact0 : bst t) (fact1 : ∃(n : ℤ), rbtree n t) : bst t ∧ (∃(n : ℤ), rbtree n t) ∧ (∀(o1 : tree), bst o1 ∧ (∀(n : ℤ), rbtree n t → almost_rbtree n o1 ∧ (is_not_red t → rbtree n o1)) ∧ memt o1 k v ∧ (∀(k' : ℤ) (v' : ℤ), memt o1 k' v' = (if k' = k then v' = v else memt t k' v')) → (match o1 with | tree.Node _ l k' v' r => True | tree.Leaf => False) ∧ (∀(result : tree), (match o1 with | tree.Node _ l k' v' r => result = tree.Node color.Black l k' v' r | tree.Leaf => False) → bst result ∧ (∃(n : ℤ), rbtree n result) ∧ memt result k v ∧ (∀(k' : ℤ) (v' : ℤ), memt result k' v' = (if k' = k then v' = v else memt t k' v'))))
  := sorry
end vacid_0_red_black_trees_RedBlackTree_addqtvc
