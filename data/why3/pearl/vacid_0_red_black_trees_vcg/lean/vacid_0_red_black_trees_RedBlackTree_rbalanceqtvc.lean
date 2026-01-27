import Why3.Base
open Classical
open Lean4Why3
namespace vacid_0_red_black_trees_RedBlackTree_rbalanceqtvc
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
theorem rbalance'vc (k : ℤ) (l : tree) (r : tree) (v : ℤ) (fact0 : lt_tree k l) (fact1 : gt_tree k r) (fact2 : bst l) (fact3 : bst r) : (match r with | tree.Node color.Red (tree.Node color.Red b ky vy c) kz vz d => True | tree.Node color.Red b ky vy (tree.Node color.Red c kz vz d) => True | _ => True) ∧ (∀(result : tree), (match r with | tree.Node color.Red (tree.Node color.Red b ky vy c) kz vz d => result = tree.Node color.Red (tree.Node color.Black l k v b) ky vy (tree.Node color.Black c kz vz d) | tree.Node color.Red b ky vy (tree.Node color.Red c kz vz d) => result = tree.Node color.Red (tree.Node color.Black l k v b) ky vy (tree.Node color.Black c kz vz d) | _ => result = tree.Node color.Black l k v r) → bst result ∧ (∀(n : ℤ), almost_rbtree n r → rbtree n l → rbtree (n + (1 : ℤ)) result) ∧ (∀(k' : ℤ) (v' : ℤ), memt result k' v' = (if k' = k then v' = v else memt l k' v' ∨ memt r k' v')))
  := sorry
end vacid_0_red_black_trees_RedBlackTree_rbalanceqtvc
