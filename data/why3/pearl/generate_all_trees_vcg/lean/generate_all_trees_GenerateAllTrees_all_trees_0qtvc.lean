import Why3.Base
open Classical
open Lean4Why3
namespace generate_all_trees_GenerateAllTrees_all_trees_0qtvc
inductive tree where
  | Empty : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l r) => (1 : ℤ) + size l + size r
noncomputable def all_trees (n : ℤ) (l : List tree) := List.Nodup l ∧ (∀(t : tree), (size t = n) = (t ∈ l))
theorem all_trees_0'vc : all_trees (0 : ℤ) (List.cons tree.Empty ([] : List tree))
  := sorry
end generate_all_trees_GenerateAllTrees_all_trees_0qtvc
