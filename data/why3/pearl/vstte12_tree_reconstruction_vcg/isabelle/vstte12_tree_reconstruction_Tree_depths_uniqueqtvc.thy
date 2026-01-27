theory vstte12_tree_reconstruction_Tree_depths_uniqueqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Leaf | Node "tree" "tree"
fun depths :: "int \<Rightarrow> tree \<Rightarrow> int list"
  where "depths d Leaf = Cons d (Nil :: int list)" for d
      | "depths d (Node l r) = depths (d + (1 :: int)) l @ depths (d + (1 :: int)) r" for d l r
theorem depths_unique'vc:
  fixes d :: "int"
  fixes t1 :: "tree"
  fixes s1 :: "int list"
  fixes t2 :: "tree"
  fixes s2 :: "int list"
  assumes fact0: "depths d t1 @ s1 = depths d t2 @ s2"
  shows "t1 = t2"
  and "s1 = s2"
  sorry
end
