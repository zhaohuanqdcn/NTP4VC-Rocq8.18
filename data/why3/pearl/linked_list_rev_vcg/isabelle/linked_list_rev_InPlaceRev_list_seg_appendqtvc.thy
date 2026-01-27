theory linked_list_rev_InPlaceRev_list_seg_appendqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts eq_loc :: "loc \<Rightarrow> loc \<Rightarrow> bool"
axiomatization where eq_loc'spec:   "eq_loc l1 l2 = True \<longleftrightarrow> l1 = l2"
  for l1 :: "loc"
  and l2 :: "loc"
consts null :: "loc"
definition disjoint :: "loc list \<Rightarrow> loc list \<Rightarrow> _"
  where "disjoint l1 l2 \<longleftrightarrow> (\<forall>(x :: loc). \<not>(x \<in> set l1 \<and> x \<in> set l2))" for l1 l2
fun no_repet :: "loc list \<Rightarrow> _"
  where "no_repet (Nil :: loc list) = True"
      | "no_repet (Cons x r) = (\<not>x \<in> set r \<and> no_repet r)" for x r
inductive list_seg :: "loc \<Rightarrow> (loc \<Rightarrow> loc) \<Rightarrow> loc list \<Rightarrow> loc \<Rightarrow> bool" where
   list_seg_nil: "list_seg p next (Nil :: loc list) p" for p :: "loc" and "next" :: "loc \<Rightarrow> loc"
 | list_seg_cons: "\<not>p = null \<Longrightarrow> list_seg (next p) next l q \<Longrightarrow> list_seg p next (Cons p l) q" for p :: "loc" and "next" :: "loc \<Rightarrow> loc" and l :: "loc list" and q :: "loc"
theorem list_seg_append'vc:
  fixes p :: "loc"
  fixes "next" :: "loc \<Rightarrow> loc"
  fixes pM :: "loc list"
  fixes q :: "loc"
  fixes qM :: "loc list"
  fixes r :: "loc"
  assumes fact0: "list_seg p next pM q"
  assumes fact1: "list_seg q next qM r"
  shows "list_seg p next (pM @ qM) r"
  sorry
end
