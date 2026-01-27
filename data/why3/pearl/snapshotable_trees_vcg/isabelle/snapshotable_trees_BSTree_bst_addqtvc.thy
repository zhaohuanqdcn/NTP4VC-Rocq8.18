theory snapshotable_trees_BSTree_bst_addqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree"
begin
definition lt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "lt_tree x t \<longleftrightarrow> (\<forall>(y :: int). mem y t \<longrightarrow> y < x)" for x t
definition gt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "gt_tree x t \<longleftrightarrow> (\<forall>(y :: int). mem y t \<longrightarrow> x < y)" for x t
fun bst :: "tree \<Rightarrow> _"
  where "bst (Empty :: tree) = True"
      | "bst (Node l x r) = (bst l \<and> bst r \<and> lt_tree x l \<and> gt_tree x r)" for l x r
theorem bst_add'vc:
  fixes t :: "tree"
  fixes x :: "int"
  assumes fact0: "bst t"
  shows "case t of (Empty :: tree) \<Rightarrow> (let result :: tree = Node (Empty :: tree) x (Empty :: tree) in bst result \<and> \<not>mem x t \<and> (\<forall>(y :: int). mem y result \<longleftrightarrow> y = x \<or> mem y t)) | Node l y r \<Rightarrow> (if x = y then mem x t else if x < y then ((case t of (Empty :: tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = l \<or> f1 = l) \<and> bst l) \<and> (\<forall>(o1 :: tree). bst o1 \<and> \<not>mem x l \<and> (\<forall>(y1 :: int). mem y1 o1 \<longleftrightarrow> y1 = x \<or> mem y1 l) \<longrightarrow> (let result :: tree = Node o1 y r in bst result \<and> \<not>mem x t \<and> (\<forall>(y1 :: int). mem y1 result \<longleftrightarrow> y1 = x \<or> mem y1 t))) \<and> (mem x l \<longrightarrow> mem x t) else ((case t of (Empty :: tree) \<Rightarrow> False | Node f _ f1 \<Rightarrow> f = r \<or> f1 = r) \<and> bst r) \<and> (\<forall>(o1 :: tree). bst o1 \<and> \<not>mem x r \<and> (\<forall>(y1 :: int). mem y1 o1 \<longleftrightarrow> y1 = x \<or> mem y1 r) \<longrightarrow> (let result :: tree = Node l y o1 in bst result \<and> \<not>mem x t \<and> (\<forall>(y1 :: int). mem y1 result \<longleftrightarrow> y1 = x \<or> mem y1 t))) \<and> (mem x r \<longrightarrow> mem x t))"
  sorry
end
