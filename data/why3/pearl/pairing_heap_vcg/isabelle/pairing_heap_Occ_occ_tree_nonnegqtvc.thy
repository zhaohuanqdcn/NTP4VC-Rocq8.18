theory pairing_heap_Occ_occ_tree_nonnegqtvc
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_HeapType"
begin
fun occ_heap :: "elt \<Rightarrow> raw_heap \<Rightarrow> int"  and occ_tree :: "elt \<Rightarrow> tree \<Rightarrow> int"  and occ_list :: "elt \<Rightarrow> tree list \<Rightarrow> int"
  where "occ_heap x (E :: raw_heap) = (0 :: int)" for x
      | "occ_heap x (H t) = occ_tree x t" for x t
      | "occ_tree x (T e l) = (if x = e then 1 :: int else (0 :: int)) + occ_list x l" for x e l
      | "occ_list x (Nil :: tree list) = (0 :: int)" for x
      | "occ_list x (Cons t r) = occ_tree x t + occ_list x r" for x t r
theorem occ_tree_nonneg'vc:
  fixes x :: "elt"
  fixes t :: "tree"
  shows "(0 :: int) \<le> occ_tree x t"
  sorry
end
