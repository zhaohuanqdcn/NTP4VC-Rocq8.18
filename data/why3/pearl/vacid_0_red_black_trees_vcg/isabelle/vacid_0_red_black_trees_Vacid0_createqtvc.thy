theory vacid_0_red_black_trees_Vacid0_createqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./vacid_0_red_black_trees_RedBlackTree"
begin
typedecl  rbt
definition inv :: "int \<times> tree \<Rightarrow> _"
  where "inv r \<longleftrightarrow> (case r of (_, t) \<Rightarrow> bst t \<and> (\<exists>(n :: int). rbtree n t))" for r
definition default :: "int \<times> tree \<Rightarrow> int"
  where "default r = (case r of (d, _) \<Rightarrow> d)" for r
definition mem :: "int \<times> tree \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "mem r k v \<longleftrightarrow> (case r of (d, t) \<Rightarrow> memt t k v \<or> v = d \<and> (\<forall>(v' :: int). \<not>memt t k v'))" for r k v
theorem create'vc:
  fixes d :: "int"
  shows "let o1 :: tree = Leaf in inv (d, o1) \<and> (\<forall>(k :: int) (v :: int). mem (d, o1) k v \<longleftrightarrow> v = d)"
  sorry
end
