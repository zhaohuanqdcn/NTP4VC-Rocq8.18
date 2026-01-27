theory vacid_0_red_black_trees_Vacid0_replaceqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./vacid_0_red_black_trees_RedBlackTree"
begin
typedecl  rbt
definition inv :: "int \<times> tree \<Rightarrow> _"
  where "inv r \<longleftrightarrow> (case r of (_, t) \<Rightarrow> bst t \<and> (\<exists>(n :: int). rbtree n t))" for r
definition default :: "int \<times> tree \<Rightarrow> int"
  where "default r = (case r of (d, _) \<Rightarrow> d)" for r
definition mem :: "int \<times> tree \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "mem r k v \<longleftrightarrow> (case r of (d, t) \<Rightarrow> memt t k v \<or> v = d \<and> (\<forall>(v' :: int). \<not>memt t k v'))" for r k v
theorem replace'vc:
  fixes m :: "int"
  fixes m1 :: "tree"
  fixes k :: "int"
  fixes v :: "int"
  assumes fact0: "inv (m, m1)"
  shows "bst m1"
  and "\<exists>(n :: int). rbtree n m1"
  and "\<forall>(o1 :: tree). bst o1 \<and> (\<exists>(n :: int). rbtree n o1) \<and> memt o1 k v \<and> (\<forall>(k' :: int) (v' :: int). memt o1 k' v' \<longleftrightarrow> (if k' = k then v' = v else memt m1 k' v')) \<longrightarrow> inv (m, o1) \<and> (\<forall>(k' :: int) (v' :: int). mem (m, o1) k' v' \<longleftrightarrow> (if k' = k then v' = v else mem (m, m1) k' v'))"
  sorry
end
