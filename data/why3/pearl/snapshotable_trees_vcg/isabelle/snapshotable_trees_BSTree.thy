theory snapshotable_trees_BSTree
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree"
begin
definition lt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "lt_tree x t \<longleftrightarrow> (\<forall>(y :: int). mem y t \<longrightarrow> y < x)" for x t
definition gt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "gt_tree x t \<longleftrightarrow> (\<forall>(y :: int). mem y t \<longrightarrow> x < y)" for x t
fun bst :: "tree \<Rightarrow> _"
  where "bst (Empty :: tree) = True"
      | "bst (Node l x r) = (bst l \<and> bst r \<and> lt_tree x l \<and> gt_tree x r)" for l x r
end
