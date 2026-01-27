theory vstte12_tree_reconstruction_Tree_depths_unique2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Leaf | Node "tree" "tree"
fun depths :: "int \<Rightarrow> tree \<Rightarrow> int list"
  where "depths d Leaf = Cons d (Nil :: int list)" for d
      | "depths d (Node l r) = depths (d + (1 :: int)) l @ depths (d + (1 :: int)) r" for d l r
theorem depths_unique2'vc:
  fixes d1 :: "int"
  fixes t1 :: "tree"
  fixes d2 :: "int"
  fixes t2 :: "tree"
  assumes fact0: "depths d1 t1 = depths d2 t2"
  shows "d1 = d2"
  and "t1 = t2"
  sorry
end
