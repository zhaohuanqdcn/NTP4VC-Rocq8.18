theory snapshotable_trees_Tree
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
datatype  tree = Empty | Node "tree" "int" "tree"
fun tree_elements :: "tree \<Rightarrow> int list"
  where "tree_elements (Empty :: tree) = (Nil :: int list)"
      | "tree_elements (Node l x r) = tree_elements l @ Cons x (tree_elements r)" for l x r
fun mem :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "mem x (Empty :: tree) = False" for x
      | "mem x (Node l y r) = (mem x l \<or> x = y \<or> mem x r)" for x l y r
end
