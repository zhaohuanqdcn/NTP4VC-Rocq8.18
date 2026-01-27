theory flexible_arrays_BraunTrees_get_treeqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.bintree_Tree" "Why3STD.bintree_Size"
begin
fun braun :: "'a tree \<Rightarrow> _"
  where "braun (Empty :: 'a tree) = True"
      | "braun (Node l x r) = ((bintree_Size.size l = bintree_Size.size r \<or> bintree_Size.size l = bintree_Size.size r + (1 :: int)) \<and> braun l \<and> braun r)" for l x r
theorem get_tree'vc:
  fixes i :: "int"
  fixes t :: "'a tree"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < bintree_Size.size t"
  assumes fact2: "braun t"
  shows "case t of (Empty :: 'a tree) \<Rightarrow> False | Node l x r \<Rightarrow> \<not>i = (0 :: int) \<longrightarrow> \<not>(2 :: int) = (0 :: int) \<and> (if i cmod (2 :: int) = (1 :: int) then \<not>(2 :: int) = (0 :: int) \<and> (let o1 :: int = i cdiv (2 :: int) in (case t of (Empty :: 'a tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = l \<or> f1 = l) \<and> ((0 :: int) \<le> o1 \<and> o1 < bintree_Size.size l) \<and> braun l) else \<not>(2 :: int) = (0 :: int) \<and> (let o1 :: int = i cdiv (2 :: int) - (1 :: int) in (case t of (Empty :: 'a tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = r \<or> f1 = r) \<and> ((0 :: int) \<le> o1 \<and> o1 < bintree_Size.size r) \<and> braun r))"
  sorry
end
