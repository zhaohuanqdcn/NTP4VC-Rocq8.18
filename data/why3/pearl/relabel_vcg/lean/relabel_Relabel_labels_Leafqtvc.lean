import Why3.Base
open Classical
open Lean4Why3
namespace relabel_Relabel_labels_Leafqtvc
inductive tree (α : Type) where
  | Leaf : α -> tree α
  | Node : tree α -> tree α -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
noncomputable def labels {α : Type} [Inhabited α] : tree α -> List α
  | (tree.Leaf x) => List.cons x ([] : List α)
  | (tree.Node l r) => labels l ++ labels r
theorem labels_Leaf'vc {α : Type} [Inhabited α] (x : α) (y : α) : (x ∈ labels (tree.Leaf y)) = (x = y)
  := sorry
end relabel_Relabel_labels_Leafqtvc
