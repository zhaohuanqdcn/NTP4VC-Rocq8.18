theory vacid_0_red_black_trees_RedBlackTree_rbtree_leftqtvc
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
definition is_not_red :: "tree \<Rightarrow> _"
  where "is_not_red t \<longleftrightarrow> (case t of Node Red _ _ _ _ \<Rightarrow> False | Leaf \<Rightarrow> True | Node Black _ _ _ _ \<Rightarrow> True)" for t
fun rbtree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "rbtree n Leaf = (n = (0 :: int))" for n
      | "rbtree n (Node Red l x x0 r) = (rbtree n l \<and> rbtree n r \<and> is_not_red l \<and> is_not_red r)" for n l x x0 r
      | "rbtree n (Node Black l x x0 r) = (rbtree (n - (1 :: int)) l \<and> rbtree (n - (1 :: int)) r)" for n l x x0 r
theorem rbtree_left'vc:
  fixes c :: "color"
  fixes l :: "tree"
  fixes x :: "int"
  fixes v :: "int"
  fixes r :: "tree"
  assumes fact0: "\<exists>(n :: int). rbtree n (Node c l x v r)"
  shows "\<exists>(n :: int). rbtree n l"
  sorry
end
