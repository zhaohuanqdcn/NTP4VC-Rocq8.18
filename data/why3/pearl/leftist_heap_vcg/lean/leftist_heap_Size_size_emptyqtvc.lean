import Why3.Base
import pearl.leftist_heap_vcg.lean.leftist_heap.TreeRank
open Classical
open Lean4Why3
namespace leftist_heap_Size_size_emptyqtvc
noncomputable def size {α : Type} [Inhabited α] : TreeRank.tree α -> ℤ
  | (TreeRank.tree.E : TreeRank.tree α) => (0 : ℤ)
  | (TreeRank.tree.N x l x0 r) => (1 : ℤ) + size l + size r
theorem size_empty'vc {α : Type} [Inhabited α] (t : TreeRank.tree α) : ((0 : ℤ) = size t) = (t = (TreeRank.tree.E : TreeRank.tree α))
  := sorry
end leftist_heap_Size_size_emptyqtvc
