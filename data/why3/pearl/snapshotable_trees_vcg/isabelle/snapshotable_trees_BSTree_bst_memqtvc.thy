theory snapshotable_trees_BSTree_bst_memqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree"
begin
definition lt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "lt_tree x t \<longleftrightarrow> (\<forall>(y :: int). mem y t \<longrightarrow> y < x)" for x t
definition gt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "gt_tree x t \<longleftrightarrow> (\<forall>(y :: int). mem y t \<longrightarrow> x < y)" for x t
fun bst :: "tree \<Rightarrow> _"
  where "bst (Empty :: tree) = True"
      | "bst (Node l x r) = (bst l \<and> bst r \<and> lt_tree x l \<and> gt_tree x r)" for l x r
theorem bst_mem'vc:
  fixes t :: "tree"
  fixes x :: "int"
  assumes fact0: "bst t"
  shows "case t of (Empty :: tree) \<Rightarrow> True | Node l y r \<Rightarrow> (if x < y then (case t of (Empty :: tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = l \<or> f1 = l) \<and> bst l else \<not>x = y \<longrightarrow> (case t of (Empty :: tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = r \<or> f1 = r) \<and> bst r)"
  and "\<forall>(result :: bool). (case t of (Empty :: tree) \<Rightarrow> result = False | Node l y r \<Rightarrow> (if x < y then result = (if mem x l then True else False) else if x = y then result = True else result = (if mem x r then True else False))) \<longrightarrow> result = True \<longleftrightarrow> mem x t"
  sorry
end
