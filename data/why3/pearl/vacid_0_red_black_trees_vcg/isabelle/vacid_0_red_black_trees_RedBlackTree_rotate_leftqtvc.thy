theory vacid_0_red_black_trees_RedBlackTree_rotate_leftqtvc
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
theorem rotate_left'vc:
  fixes c1 :: "color"
  fixes a :: "tree"
  fixes kx :: "int"
  fixes vx :: "int"
  fixes c2 :: "color"
  fixes b :: "tree"
  fixes ky :: "int"
  fixes vy :: "int"
  fixes c :: "tree"
  fixes c3 :: "color"
  fixes c4 :: "color"
  assumes fact0: "bst (Node c1 a kx vx (Node c2 b ky vy c))"
  shows "bst (Node c3 (Node c4 a kx vx b) ky vy c)"
  sorry
end
