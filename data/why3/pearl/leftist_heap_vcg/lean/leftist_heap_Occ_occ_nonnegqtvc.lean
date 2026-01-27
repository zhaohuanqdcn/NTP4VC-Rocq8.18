import Why3.Base
import pearl.leftist_heap_vcg.lean.leftist_heap.TreeRank
open Classical
open Lean4Why3
namespace leftist_heap_Occ_occ_nonnegqtvc
noncomputable def occ {α : Type} [Inhabited α] : α -> TreeRank.tree α -> ℤ
  | x, (TreeRank.tree.E : TreeRank.tree α) => (0 : ℤ)
  | x, (TreeRank.tree.N x0 l e r) => (if x = e then (1 : ℤ) else (0 : ℤ)) + occ x l + occ x r
theorem occ_nonneg'vc {α : Type} [Inhabited α] (x : α) (t : TreeRank.tree α) : (0 : ℤ) ≤ occ x t
  := sorry
end leftist_heap_Occ_occ_nonnegqtvc
