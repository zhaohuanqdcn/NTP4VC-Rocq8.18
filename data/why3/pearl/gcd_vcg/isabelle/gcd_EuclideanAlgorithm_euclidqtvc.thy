theory gcd_EuclideanAlgorithm_euclidqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem euclid'vc:
  fixes u :: "int"
  fixes v :: "int"
  assumes fact0: "(0 :: int) \<le> u"
  assumes fact1: "(0 :: int) \<le> v"
  shows "\<not>v = (0 :: int) \<longrightarrow> \<not>v = (0 :: int) \<and> (let o1 :: int = u cmod v in ((0 :: int) \<le> v \<and> o1 < v) \<and> (0 :: int) \<le> v \<and> (0 :: int) \<le> o1)"
  and "\<forall>(result :: int). (if v = (0 :: int) then result = u else result = gcd v (u cmod v)) \<longrightarrow> result = gcd u v"
  sorry
end
