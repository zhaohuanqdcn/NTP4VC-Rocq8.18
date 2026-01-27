theory gcd_vc_sp_EuclideanAlgorithm63_euclidqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem euclid'vc:
  fixes u :: "63 word"
  fixes v :: "63 word"
  assumes fact0: "(0 :: int) \<le> sint u"
  assumes fact1: "(0 :: int) \<le> sint v"
  shows "(sint v = (0 :: int) \<longrightarrow> v = (0 :: 63 word)) \<longrightarrow> \<not>v = (0 :: 63 word) \<longrightarrow> (\<not>sint v = (0 :: int) \<and> int'63_in_bounds (sint u cmod sint v)) \<and> (\<forall>(o1 :: 63 word). sint o1 = sint u cmod sint v \<longrightarrow> ((0 :: int) \<le> sint v \<and> sint o1 < sint v) \<and> (0 :: int) \<le> sint v \<and> (0 :: int) \<le> sint o1)"
  and "\<forall>(result :: 63 word). (sint v = (0 :: int) \<longrightarrow> v = (0 :: 63 word)) \<and> (if v = (0 :: 63 word) then result = u else \<exists>(o1 :: 63 word). sint o1 = sint u cmod sint v \<and> sint result = gcd (sint v) (sint o1)) \<longrightarrow> sint result = gcd (sint u) (sint v)"
  sorry
end
