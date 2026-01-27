import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_Tree_depths_prefix_simpleqtvc
inductive tree where
  | Leaf : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def depths : ℤ -> tree -> List ℤ
  | d, tree.Leaf => List.cons d ([] : List ℤ)
  | d, (tree.Node l r) => depths (d + (1 : ℤ)) l ++ depths (d + (1 : ℤ)) r
theorem depths_prefix_simple'vc (d1 : ℤ) (t : tree) (d2 : ℤ) (fact0 : depths d1 t = depths d2 t) : d1 = d2
  := sorry
end vstte12_tree_reconstruction_Tree_depths_prefix_simpleqtvc
