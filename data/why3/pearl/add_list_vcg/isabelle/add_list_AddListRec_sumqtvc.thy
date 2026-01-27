theory add_list_AddListRec_sumqtvc
  imports "NTP4Verif.NTP4Verif" "./add_list_SumList"
begin
theorem sum'vc:
  fixes l :: "or_integer_float list"
  shows "case l of Nil \<Rightarrow> True | Cons h t \<Rightarrow> (case l of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = t) \<and> (case h of Integer n \<Rightarrow> True | Real x \<Rightarrow> True)"
  and "\<forall>(si :: int) (sf :: real). (case l of Nil \<Rightarrow> si = (0 :: int) \<and> sf = (0 :: Real.real) | Cons h t \<Rightarrow> (case h of Integer n \<Rightarrow> si = n + add_int t \<and> sf = add_real t | Real x \<Rightarrow> si = add_int t \<and> sf = x + add_real t)) \<longrightarrow> si = add_int l \<and> sf = add_real l"
  sorry
end
