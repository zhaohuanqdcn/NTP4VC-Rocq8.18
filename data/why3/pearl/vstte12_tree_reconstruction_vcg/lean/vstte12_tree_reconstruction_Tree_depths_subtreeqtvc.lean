import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_Tree_depths_subtreeqtvc
inductive tree where
  | Leaf : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def depths : ℤ -> tree -> List ℤ
  | d, tree.Leaf => List.cons d ([] : List ℤ)
  | d, (tree.Node l r) => depths (d + (1 : ℤ)) l ++ depths (d + (1 : ℤ)) r
theorem depths_subtree'vc (d1 : ℤ) (t1 : tree) (s1 : List ℤ) (d2 : ℤ) (t2 : tree) (fact0 : depths d1 t1 ++ s1 = depths d2 t2) : d2 ≤ d1
  := sorry
end vstte12_tree_reconstruction_Tree_depths_subtreeqtvc
