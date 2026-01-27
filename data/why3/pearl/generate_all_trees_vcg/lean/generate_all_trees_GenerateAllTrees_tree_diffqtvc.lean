import Why3.Base
open Classical
open Lean4Why3
namespace generate_all_trees_GenerateAllTrees_tree_diffqtvc
inductive tree where
  | Empty : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l r) => (1 : ℤ) + size l + size r
noncomputable def all_trees (n : ℤ) (l : List tree) := List.Nodup l ∧ (∀(t : tree), (size t = n) = (t ∈ l))
theorem tree_diff'vc (fact0 : ¬True) : ¬True
  := sorry
end generate_all_trees_GenerateAllTrees_tree_diffqtvc
