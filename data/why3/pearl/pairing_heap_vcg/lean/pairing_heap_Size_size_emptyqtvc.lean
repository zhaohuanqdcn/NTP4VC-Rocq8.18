import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
open Classical
open Lean4Why3
namespace pairing_heap_Size_size_emptyqtvc
mutual
noncomputable def size_heap : HeapType.raw_heap -> ℤ
  | HeapType.raw_heap.E => (0 : ℤ)
  | (HeapType.raw_heap.H t) => size_tree t
noncomputable def size_tree : HeapType.tree -> ℤ
  | (HeapType.tree.T x l) => (1 : ℤ) + size_list l
noncomputable def size_list : List HeapType.tree -> ℤ
  | ([] : List HeapType.tree) => (0 : ℤ)
  | (List.cons t l1) => size_tree t + size_list l1
end
theorem size_empty'vc (h : HeapType.raw_heap) : (size_heap h = (0 : ℤ)) = (h = HeapType.raw_heap.E)
  := sorry
end pairing_heap_Size_size_emptyqtvc
