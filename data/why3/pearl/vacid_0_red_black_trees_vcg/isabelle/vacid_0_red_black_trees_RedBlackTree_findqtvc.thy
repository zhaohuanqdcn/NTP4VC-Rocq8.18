theory vacid_0_red_black_trees_RedBlackTree_findqtvc
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
theorem find'vc:
  fixes t :: "tree"
  fixes k :: "int"
  assumes fact0: "bst t"
  shows "case t of Leaf \<Rightarrow> (\<forall>(v :: int). \<not>memt t k v) | Node _ l k' v r \<Rightarrow> (if k = k' then memt t k v else if k < k' then ((case t of Leaf \<Rightarrow> False | Node _ f _ _ f1 \<Rightarrow> f = l \<or> f1 = l) \<and> bst l) \<and> (\<forall>(result :: int). memt l k result \<longrightarrow> memt t k result) \<and> ((\<forall>(v1 :: int). \<not>memt l k v1) \<longrightarrow> (\<forall>(v1 :: int). \<not>memt t k v1)) else ((case t of Leaf \<Rightarrow> False | Node _ f _ _ f1 \<Rightarrow> f = r \<or> f1 = r) \<and> bst r) \<and> (\<forall>(result :: int). memt r k result \<longrightarrow> memt t k result) \<and> ((\<forall>(v1 :: int). \<not>memt r k v1) \<longrightarrow> (\<forall>(v1 :: int). \<not>memt t k v1)))"
  sorry
end
