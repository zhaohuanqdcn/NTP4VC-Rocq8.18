theory linked_list_rev_InPlaceRev_mem_decompqtvc
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
theorem mem_decomp'vc:
  fixes x :: "loc"
  fixes l :: "loc list"
  assumes fact0: "x \<in> set l"
  shows "case l of Nil \<Rightarrow> False | Cons h t \<Rightarrow> (let o1 :: bool = eq_loc h x in (o1 = True \<longleftrightarrow> h = x) \<longrightarrow> \<not>o1 = True \<longrightarrow> (case l of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = t) \<and> x \<in> set t)"
  and "\<forall>(l1 :: loc list) (l2 :: loc list). (case l of Nil \<Rightarrow> False | Cons h t \<Rightarrow> (let o1 :: bool = eq_loc h x in (o1 = True \<longleftrightarrow> h = x) \<and> (if o1 = True then l1 = (Nil :: loc list) \<and> l2 = t else \<exists>(l11 :: loc list). t = l11 @ Cons x l2 \<and> l1 = Cons h l11))) \<longrightarrow> l = l1 @ Cons x l2"
  sorry
end
