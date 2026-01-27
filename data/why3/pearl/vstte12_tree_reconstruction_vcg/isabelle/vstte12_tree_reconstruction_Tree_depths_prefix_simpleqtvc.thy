theory vstte12_tree_reconstruction_Tree_depths_prefix_simpleqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Leaf | Node "tree" "tree"
fun depths :: "int \<Rightarrow> tree \<Rightarrow> int list"
  where "depths d Leaf = Cons d (Nil :: int list)" for d
      | "depths d (Node l r) = depths (d + (1 :: int)) l @ depths (d + (1 :: int)) r" for d l r
theorem depths_prefix_simple'vc:
  fixes d1 :: "int"
  fixes t :: "tree"
  fixes d2 :: "int"
  assumes fact0: "depths d1 t = depths d2 t"
  shows "d1 = d2"
  sorry
end
