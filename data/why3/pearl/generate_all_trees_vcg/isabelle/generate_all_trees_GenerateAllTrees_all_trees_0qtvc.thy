theory generate_all_trees_GenerateAllTrees_all_trees_0qtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "tree"
fun size :: "tree \<Rightarrow> int"
  where "size (Empty :: tree) = (0 :: int)"
      | "size (Node l r) = (1 :: int) + size l + size r" for l r
definition all_trees :: "int \<Rightarrow> tree list \<Rightarrow> _"
  where "all_trees n l \<longleftrightarrow> distinct l \<and> (\<forall>(t :: tree). size t = n \<longleftrightarrow> t \<in> set l)" for n l
theorem all_trees_0'vc:
  shows "all_trees (0 :: int) (Cons (Empty :: tree) (Nil :: tree list))"
  sorry
end
