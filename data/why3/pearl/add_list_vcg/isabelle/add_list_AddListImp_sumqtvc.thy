theory add_list_AddListImp_sumqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./add_list_SumList"
begin
theorem sum'vc:
  fixes l :: "or_integer_float list"
  shows "(0 :: int) + add_int l = add_int l"
  and "(0 :: Real.real) + add_real l = add_real l"
  and "\<forall>(ll :: or_integer_float list) (sf :: real) (si :: int). si + add_int ll = add_int l \<and> sf + add_real ll = add_real l \<longrightarrow> (case ll of Nil \<Rightarrow> si = add_int l \<and> sf = add_real l | Cons (Integer n) t \<Rightarrow> (case ll of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = t) \<and> si + n + add_int t = add_int l \<and> sf + add_real t = add_real l | Cons (Real x) t \<Rightarrow> (case ll of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = t) \<and> si + add_int t = add_int l \<and> sf + x + add_real t = add_real l)"
  sorry
end
