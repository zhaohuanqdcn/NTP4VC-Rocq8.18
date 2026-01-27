import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_Tree_depths_prefixqtvc
inductive tree where
  | Leaf : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def depths : ℤ -> tree -> List ℤ
  | d, tree.Leaf => List.cons d ([] : List ℤ)
  | d, (tree.Node l r) => depths (d + (1 : ℤ)) l ++ depths (d + (1 : ℤ)) r
theorem depths_prefix'vc (d1 : ℤ) (t : tree) (s1 : List ℤ) (d2 : ℤ) (s2 : List ℤ) (fact0 : depths d1 t ++ s1 = depths d2 t ++ s2) : d1 = d2
  := sorry
end vstte12_tree_reconstruction_Tree_depths_prefixqtvc
