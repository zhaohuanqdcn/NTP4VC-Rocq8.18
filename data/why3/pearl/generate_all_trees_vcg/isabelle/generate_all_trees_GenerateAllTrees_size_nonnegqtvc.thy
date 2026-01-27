theory generate_all_trees_GenerateAllTrees_size_nonnegqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "tree"
fun size :: "tree \<Rightarrow> int"
  where "size (Empty :: tree) = (0 :: int)"
      | "size (Node l r) = (1 :: int) + size l + size r" for l r
theorem size_nonneg'vc:
  fixes t :: "tree"
  shows "(0 :: int) \<le> size t"
  sorry
end
