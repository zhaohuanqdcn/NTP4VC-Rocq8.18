import Why3.Base
import pearl.flexible_arrays_vcg.lean.flexible_arrays.BraunTrees
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_FlexibleArrays_tqtvc
theorem t'vc {α : Type} [Inhabited α] : ∃(tree : Tree.tree α), BraunTrees.braun tree ∧ (0 : ℤ) ≤ Size.size tree
  := sorry
end flexible_arrays_FlexibleArrays_tqtvc
