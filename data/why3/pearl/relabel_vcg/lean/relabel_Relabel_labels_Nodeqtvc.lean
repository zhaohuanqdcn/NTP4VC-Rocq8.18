import Why3.Base
open Classical
open Lean4Why3
namespace relabel_Relabel_labels_Nodeqtvc
inductive tree (α : Type) where
  | Leaf : α -> tree α
  | Node : tree α -> tree α -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
noncomputable def labels {α : Type} [Inhabited α] : tree α -> List α
  | (tree.Leaf x) => List.cons x ([] : List α)
  | (tree.Node l r) => labels l ++ labels r
theorem labels_Node'vc {α : Type} [Inhabited α] (x : α) (l : tree α) (r : tree α) : (x ∈ labels (tree.Node l r)) = (x ∈ labels l ∨ x ∈ labels r)
  := sorry
end relabel_Relabel_labels_Nodeqtvc
