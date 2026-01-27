theory vstte12_tree_reconstruction_Tree_depths_subtreeqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Leaf | Node "tree" "tree"
fun depths :: "int \<Rightarrow> tree \<Rightarrow> int list"
  where "depths d Leaf = Cons d (Nil :: int list)" for d
      | "depths d (Node l r) = depths (d + (1 :: int)) l @ depths (d + (1 :: int)) r" for d l r
theorem depths_subtree'vc:
  fixes d1 :: "int"
  fixes t1 :: "tree"
  fixes s1 :: "int list"
  fixes d2 :: "int"
  fixes t2 :: "tree"
  assumes fact0: "depths d1 t1 @ s1 = depths d2 t2"
  shows "d2 \<le> d1"
  sorry
end
