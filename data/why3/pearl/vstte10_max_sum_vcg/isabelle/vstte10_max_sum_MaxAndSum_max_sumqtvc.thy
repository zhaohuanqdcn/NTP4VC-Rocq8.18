theory vstte10_max_sum_MaxAndSum_max_sumqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem max_sum'vc:
  fixes a :: "int list"
  assumes fact0: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> (0 :: int) \<le> a ! nat i"
  shows "let o1 :: int = int (length a) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (0 :: int) \<le> (0 :: int) * (0 :: int) \<and> (\<forall>(max :: int) (sum :: int). (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> sum \<le> i * max \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (if max < a ! nat i then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> sum + a ! nat i \<le> (i + (1 :: int)) * a ! nat i else ((0 :: int) \<le> i \<and> i < int (length a)) \<and> sum + a ! nat i \<le> (i + (1 :: int)) * max)) \<and> (sum \<le> (o1 + (1 :: int)) * max \<longrightarrow> sum \<le> int (length a) * max))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> (0 :: int) \<le> int (length a) * (0 :: int))"
  sorry
end
