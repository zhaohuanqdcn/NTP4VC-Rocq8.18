namespace Occ
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
noncomputable def mem (x : HeapType.elt) (h : HeapType.raw_heap) := (0 : ℤ) < occ_heap x h
noncomputable def mem_tree (x : HeapType.elt) (t : HeapType.tree) := (0 : ℤ) < occ_tree x t
noncomputable def mem_list (x : HeapType.elt) (l : List HeapType.tree) := (0 : ℤ) < occ_list x l
end Occ
