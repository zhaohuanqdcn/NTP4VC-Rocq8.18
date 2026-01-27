theory vacid_0_red_black_trees_RedBlackTree_bst_colorqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  key
typedecl  "value"
datatype  color = Red | Black
datatype  tree = Leaf | Node "color" "tree" "int" "int" "tree"
fun memt :: "tree \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "memt Leaf k v = False" for k v
      | "memt (Node x l k' v' r) k v = (k = k' \<and> v = v' \<or> memt l k v \<or> memt r k v)" for x l k' v' r k v
definition lt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "lt_tree x t \<longleftrightarrow> (\<forall>(k :: int) (v :: int). memt t k v \<longrightarrow> k < x)" for x t
definition gt_tree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "gt_tree x t \<longleftrightarrow> (\<forall>(k :: int) (v :: int). memt t k v \<longrightarrow> x < k)" for x t
fun bst :: "tree \<Rightarrow> _"
  where "bst Leaf = True"
      | "bst (Node x l k x0 r) = (bst l \<and> bst r \<and> lt_tree k l \<and> gt_tree k r)" for x l k x0 r
theorem bst_color'vc:
  fixes c :: "color"
  fixes l :: "tree"
  fixes k :: "int"
  fixes v :: "int"
  fixes r :: "tree"
  fixes c' :: "color"
  assumes fact0: "bst (Node c l k v r)"
  shows "bst (Node c' l k v r)"
  sorry
end
