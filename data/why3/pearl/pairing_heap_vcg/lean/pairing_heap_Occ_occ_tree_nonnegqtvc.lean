import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
open Classical
open Lean4Why3
namespace pairing_heap_Occ_occ_tree_nonnegqtvc
mutual
noncomputable def occ_heap : HeapType.elt -> HeapType.raw_heap -> ℤ
  | x, HeapType.raw_heap.E => (0 : ℤ)
  | x, (HeapType.raw_heap.H t) => occ_tree x t
noncomputable def occ_tree : HeapType.elt -> HeapType.tree -> ℤ
  | x, (HeapType.tree.T e l) => (if x = e then (1 : ℤ) else (0 : ℤ)) + occ_list x l
noncomputable def occ_list : HeapType.elt -> List HeapType.tree -> ℤ
  | x, ([] : List HeapType.tree) => (0 : ℤ)
  | x, (List.cons t r) => occ_tree x t + occ_list x r
end
theorem occ_tree_nonneg'vc (x : HeapType.elt) (t : HeapType.tree) : (0 : ℤ) ≤ occ_tree x t
  := sorry
end pairing_heap_Occ_occ_tree_nonnegqtvc
