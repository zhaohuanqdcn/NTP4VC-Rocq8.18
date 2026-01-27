theory vacid_0_red_black_trees_RedBlackTree_addqtvc
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
definition almost_rbtree :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "almost_rbtree n t \<longleftrightarrow> (case t of Leaf \<Rightarrow> n = (0 :: int) | Node Red l _ _ r \<Rightarrow> rbtree n l \<and> rbtree n r | Node Black l _ _ r \<Rightarrow> rbtree (n - (1 :: int)) l \<and> rbtree (n - (1 :: int)) r)" for n t
theorem add'vc:
  fixes t :: "tree"
  fixes k :: "int"
  fixes v :: "int"
  assumes fact0: "bst t"
  assumes fact1: "\<exists>(n :: int). rbtree n t"
  shows "bst t"
  and "\<exists>(n :: int). rbtree n t"
  and "\<forall>(o1 :: tree). bst o1 \<and> (\<forall>(n :: int). rbtree n t \<longrightarrow> almost_rbtree n o1 \<and> (is_not_red t \<longrightarrow> rbtree n o1)) \<and> memt o1 k v \<and> (\<forall>(k' :: int) (v' :: int). memt o1 k' v' \<longleftrightarrow> (if k' = k then v' = v else memt t k' v')) \<longrightarrow> (case o1 of Node _ l k' v' r \<Rightarrow> True | Leaf \<Rightarrow> False) \<and> (\<forall>(result :: tree). (case o1 of Node _ l k' v' r \<Rightarrow> result = Node Black l k' v' r | Leaf \<Rightarrow> False) \<longrightarrow> bst result \<and> (\<exists>(n :: int). rbtree n result) \<and> memt result k v \<and> (\<forall>(k' :: int) (v' :: int). memt result k' v' \<longleftrightarrow> (if k' = k then v' = v else memt t k' v')))"
  sorry
end
