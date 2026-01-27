import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.TreeReconstruction
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_Harness_harnessqtvc
theorem harness'vc : let o1 : List ℤ := List.cons (1 : ℤ) (List.cons (3 : ℤ) (List.cons (3 : ℤ) (List.cons (2 : ℤ) ([] : List ℤ)))); (∀(result : Tree.tree), Tree.depths (0 : ℤ) result = o1 → result = Tree.tree.Node Tree.tree.Leaf (Tree.tree.Node (Tree.tree.Node Tree.tree.Leaf Tree.tree.Leaf) Tree.tree.Leaf)) ∧ ¬(∀(t : Tree.tree), ¬Tree.depths (0 : ℤ) t = o1)
  := sorry
end vstte12_tree_reconstruction_Harness_harnessqtvc
