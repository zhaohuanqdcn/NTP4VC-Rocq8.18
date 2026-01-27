theory vstte12_tree_reconstruction_Tree
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Leaf | Node "tree" "tree"
fun depths :: "int \<Rightarrow> tree \<Rightarrow> int list"
  where "depths d Leaf = Cons d (Nil :: int list)" for d
      | "depths d (Node l r) = depths (d + (1 :: int)) l @ depths (d + (1 :: int)) r" for d l r
end
