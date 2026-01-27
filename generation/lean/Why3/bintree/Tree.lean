import Why3.Base
open Classical
open Lean4Why3
namespace Tree
inductive tree (α : Type) where
  | Empty : tree α
  | Node : tree α -> α -> tree α -> tree α
axiom inhabited_axiom_tree {α : Type} [Inhabited α] : Inhabited (tree α)
attribute [instance] inhabited_axiom_tree
noncomputable def is_empty {α : Type} [Inhabited α] (t : tree α) := match t with | (tree.Empty : tree α) => True | tree.Node _ _ _ => False
axiom is_empty'spec {α : Type} [Inhabited α] (t : tree α) : is_empty t = (t = (tree.Empty : tree α))
end Tree
