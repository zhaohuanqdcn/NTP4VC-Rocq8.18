theory vstte12_tree_reconstruction_Tree_depths_prefixqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Leaf | Node "tree" "tree"
fun depths :: "int \<Rightarrow> tree \<Rightarrow> int list"
  where "depths d Leaf = Cons d (Nil :: int list)" for d
      | "depths d (Node l r) = depths (d + (1 :: int)) l @ depths (d + (1 :: int)) r" for d l r
theorem depths_prefix'vc:
  fixes d1 :: "int"
  fixes t :: "tree"
  fixes s1 :: "int list"
  fixes d2 :: "int"
  fixes s2 :: "int list"
  assumes fact0: "depths d1 t @ s1 = depths d2 t @ s2"
  shows "d1 = d2"
  sorry
end
