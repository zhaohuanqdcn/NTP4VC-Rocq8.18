theory leftist_heap_Size_size_nonnegqtvc
  imports "NTP4Verif.NTP4Verif" "./leftist_heap_TreeRank"
begin
fun size :: "'a tree \<Rightarrow> int"
  where "size (E :: 'a tree) = (0 :: int)"
      | "size (N x l x0 r) = (1 :: int) + size l + size r" for x l x0 r
theorem size_nonneg'vc:
  fixes t :: "'a tree"
  shows "(0 :: int) \<le> size t"
  sorry
end
