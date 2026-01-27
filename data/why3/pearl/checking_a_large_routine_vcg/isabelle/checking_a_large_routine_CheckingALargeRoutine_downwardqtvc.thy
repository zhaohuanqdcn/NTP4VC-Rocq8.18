theory checking_a_large_routine_CheckingALargeRoutine_downwardqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fact"
begin
theorem downward'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n"
  and "n \<le> n"
  and "(1 :: int) * fact n = fact n"
  and "\<forall>(u :: int) (r :: int). ((0 :: int) \<le> r \<and> r \<le> n) \<and> u * fact r = fact n \<longrightarrow> (if \<not>r = (0 :: int) then (((1 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> r) \<and> u = (1 :: int) * u) \<and> (\<forall>(s :: int). (1 :: int) \<le> s \<and> s \<le> r \<longrightarrow> (if \<not>s = r then ((0 :: int) \<le> r - s \<and> r - (s + (1 :: int)) < r - s) \<and> ((1 :: int) \<le> s + (1 :: int) \<and> s + (1 :: int) \<le> r) \<and> s * u + u = (s + (1 :: int)) * u else ((0 :: int) \<le> r \<and> r - (1 :: int) < r) \<and> ((0 :: int) \<le> r - (1 :: int) \<and> r - (1 :: int) \<le> n) \<and> s * u * fact (r - (1 :: int)) = fact n)) else u = fact n)"
  sorry
end
