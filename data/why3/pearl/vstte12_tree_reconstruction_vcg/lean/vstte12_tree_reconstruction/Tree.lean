import Why3.Base
open Classical
open Lean4Why3
namespace Tree
inductive tree where
  | Leaf : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def depths : ℤ -> tree -> List ℤ
  | d, tree.Leaf => List.cons d ([] : List ℤ)
  | d, (tree.Node l r) => depths (d + (1 : ℤ)) l ++ depths (d + (1 : ℤ)) r
end Tree
