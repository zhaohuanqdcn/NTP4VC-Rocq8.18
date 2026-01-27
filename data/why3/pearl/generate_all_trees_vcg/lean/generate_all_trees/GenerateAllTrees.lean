import Why3.Base
open Classical
open Lean4Why3
namespace GenerateAllTrees
inductive tree where
  | Empty : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l r) => (1 : ℤ) + size l + size r
noncomputable def all_trees (n : ℤ) (l : List tree) := List.Nodup l ∧ (∀(t : tree), (size t = n) = (t ∈ l))
end GenerateAllTrees
