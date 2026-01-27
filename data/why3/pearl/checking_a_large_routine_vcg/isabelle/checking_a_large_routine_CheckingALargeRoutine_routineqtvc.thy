theory checking_a_large_routine_CheckingALargeRoutine_routineqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fact"
begin
theorem routine'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> n"
  and "(1 :: int) = fact (0 :: int)"
  and "\<forall>(r :: int). (0 :: int) \<le> r \<and> r \<le> n \<longrightarrow> (if r < n then (((1 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> r + (1 :: int)) \<and> fact r = (1 :: int) * fact r) \<and> (\<forall>(s :: int). (1 :: int) \<le> s \<and> s \<le> r + (1 :: int) \<longrightarrow> (if s \<le> r then ((0 :: int) \<le> r - s \<and> r - (s + (1 :: int)) < r - s) \<and> ((1 :: int) \<le> s + (1 :: int) \<and> s + (1 :: int) \<le> r + (1 :: int)) \<and> s * fact r + fact r = (s + (1 :: int)) * fact r else ((0 :: int) \<le> n - r \<and> n - (r + (1 :: int)) < n - r) \<and> ((0 :: int) \<le> r + (1 :: int) \<and> r + (1 :: int) \<le> n) \<and> s * fact r = fact (r + (1 :: int)))) else fact r = fact n)"
  sorry
end
