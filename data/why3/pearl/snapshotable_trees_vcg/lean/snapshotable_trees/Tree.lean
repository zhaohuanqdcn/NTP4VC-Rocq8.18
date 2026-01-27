import Why3.Base
open Classical
open Lean4Why3
namespace Tree
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
inductive tree where
  | Empty : tree
  | Node : tree -> ℤ -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def tree_elements : tree -> List ℤ
  | tree.Empty => ([] : List ℤ)
  | (tree.Node l x r) => tree_elements l ++ List.cons x (tree_elements r)
noncomputable def mem : ℤ -> tree -> Prop
  | x, tree.Empty => False
  | x, (tree.Node l y r) => mem x l ∨ x = y ∨ mem x r
end Tree
