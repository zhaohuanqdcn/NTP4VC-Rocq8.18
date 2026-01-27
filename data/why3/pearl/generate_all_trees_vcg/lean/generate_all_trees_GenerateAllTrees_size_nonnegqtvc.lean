import Why3.Base
open Classical
open Lean4Why3
namespace generate_all_trees_GenerateAllTrees_size_nonnegqtvc
inductive tree where
  | Empty : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l r) => (1 : ℤ) + size l + size r
theorem size_nonneg'vc (t : tree) : (0 : ℤ) ≤ size t
  := sorry
end generate_all_trees_GenerateAllTrees_size_nonnegqtvc
