theory checking_a_large_routine_CheckingALargeRoutine_routine2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fact"
begin
theorem routine2'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "let o1 :: int = n - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (1 :: int) = fact (0 :: int) \<and> (\<forall>(u :: int). (\<forall>(r :: int). ((0 :: int) \<le> r \<and> r \<le> o1) \<and> u = fact r \<longrightarrow> ((1 :: int) \<le> r + (1 :: int) \<longrightarrow> u = (1 :: int) * fact r \<and> (\<forall>(u1 :: int). (\<forall>(s :: int). ((1 :: int) \<le> s \<and> s \<le> r) \<and> u1 = s * fact r \<longrightarrow> u1 + u = (s + (1 :: int)) * fact r) \<and> (u1 = (r + (1 :: int)) * fact r \<longrightarrow> u1 = fact (r + (1 :: int))))) \<and> (r + (1 :: int) < (1 :: int) \<longrightarrow> u = fact (r + (1 :: int)))) \<and> (u = fact (o1 + (1 :: int)) \<longrightarrow> u = fact n))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> (1 :: int) = fact n)"
  sorry
end
