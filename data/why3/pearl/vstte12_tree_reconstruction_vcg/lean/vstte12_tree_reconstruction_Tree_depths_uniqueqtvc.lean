import Why3.Base
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_Tree_depths_uniqueqtvc
inductive tree where
  | Leaf : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def depths : ℤ -> tree -> List ℤ
  | d, tree.Leaf => List.cons d ([] : List ℤ)
  | d, (tree.Node l r) => depths (d + (1 : ℤ)) l ++ depths (d + (1 : ℤ)) r
theorem depths_unique'vc (d : ℤ) (t1 : tree) (s1 : List ℤ) (t2 : tree) (s2 : List ℤ) (fact0 : depths d t1 ++ s1 = depths d t2 ++ s2) : t1 = t2 ∧ s1 = s2
  := sorry
end vstte12_tree_reconstruction_Tree_depths_uniqueqtvc
