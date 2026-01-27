theory pairing_heap_Size_size_emptyqtvc
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_HeapType"
begin
fun size_heap :: "raw_heap \<Rightarrow> int"  and size_tree :: "tree \<Rightarrow> int"  and size_list :: "tree list \<Rightarrow> int"
  where "size_heap (E :: raw_heap) = (0 :: int)"
      | "size_heap (H t) = size_tree t" for t
      | "size_tree (T x l) = (1 :: int) + size_list l" for x l
      | "size_list (Nil :: tree list) = (0 :: int)"
      | "size_list (Cons t l1) = size_tree t + size_list l1" for t l1
theorem size_empty'vc:
  fixes h :: "raw_heap"
  shows "size_heap h = (0 :: int) \<longleftrightarrow> h = (E :: raw_heap)"
  sorry
end
