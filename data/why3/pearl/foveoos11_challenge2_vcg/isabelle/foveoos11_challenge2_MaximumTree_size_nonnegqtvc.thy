theory foveoos11_challenge2_MaximumTree_size_nonnegqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "int" "tree"
fun size :: "tree \<Rightarrow> int"
  where "size (Empty :: tree) = (0 :: int)"
      | "size (Node l x r) = (1 :: int) + size l + size r" for l x r
theorem size_nonneg'vc:
  fixes t :: "tree"
  shows "(0 :: int) \<le> size t"
  sorry
end
