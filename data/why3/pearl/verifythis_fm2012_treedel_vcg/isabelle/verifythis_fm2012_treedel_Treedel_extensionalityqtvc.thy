theory verifythis_fm2012_treedel_Treedel_extensionalityqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./verifythis_fm2012_treedel_Memory" "Why3STD.bintree_Tree" "Why3STD.bintree_Inorder"
begin
definition root :: "loc tree \<Rightarrow> loc"
  where "root t = (case t of (Empty :: loc tree) \<Rightarrow> null | Node _ p _ \<Rightarrow> p)" for t
fun istree :: "(loc \<Rightarrow> node) \<Rightarrow> loc tree \<Rightarrow> _"
  where "istree m (Empty :: loc tree) = True" for m
      | "istree m (Node l p r) = (\<not>p = null \<and> istree m l \<and> istree m r \<and> root l = left1 (m p) \<and> root r = right1 (m p))" for m l p r
theorem extensionality'vc:
  fixes m :: "loc \<Rightarrow> node"
  fixes t :: "loc tree"
  fixes m' :: "loc \<Rightarrow> node"
  assumes fact0: "istree m t"
  assumes fact1: "\<forall>(p :: loc). p \<in> set (inorder t) \<longrightarrow> left1 (m p) = left1 (m' p) \<and> right1 (m p) = right1 (m' p)"
  shows "istree m' t"
  sorry
end
