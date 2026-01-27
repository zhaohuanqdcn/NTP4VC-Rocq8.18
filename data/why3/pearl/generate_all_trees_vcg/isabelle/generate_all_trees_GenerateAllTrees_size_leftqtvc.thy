theory generate_all_trees_GenerateAllTrees_size_leftqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "tree"
fun size :: "tree \<Rightarrow> int"
  where "size (Empty :: tree) = (0 :: int)"
      | "size (Node l r) = (1 :: int) + size l + size r" for l r
theorem size_left'vc:
  fixes t :: "tree"
  assumes fact0: "(0 :: int) < size t"
  shows "\<exists>(l :: tree) (r :: tree). t = Node l r \<and> size l < size t"
  sorry
end
