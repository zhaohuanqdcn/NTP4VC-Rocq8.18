theory vacid_0_red_black_trees_RedBlackTree_gt_tree_nodeqtvc
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
theorem gt_tree_node'vc:
  fixes x :: "int"
  fixes l :: "tree"
  fixes r :: "tree"
  fixes y :: "int"
  fixes c :: "color"
  fixes v :: "int"
  assumes fact0: "gt_tree x l"
  assumes fact1: "gt_tree x r"
  assumes fact2: "x < y"
  shows "gt_tree x (Node c l y v r)"
  sorry
end
