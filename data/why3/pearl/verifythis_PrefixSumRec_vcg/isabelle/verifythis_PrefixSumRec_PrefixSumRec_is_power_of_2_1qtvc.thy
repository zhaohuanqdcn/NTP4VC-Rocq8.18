theory verifythis_PrefixSumRec_PrefixSumRec_is_power_of_2_1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Sum"
begin
definition is_power_of_2 :: "int \<Rightarrow> _"
  where "is_power_of_2 x \<longleftrightarrow> (\<exists>(k :: int). (0 :: int) \<le> k \<and> x = (2 :: int) ^\<^sub>i k)" for x
theorem is_power_of_2_1'vc:
  fixes x :: "int"
  assumes fact0: "is_power_of_2 x"
  assumes fact1: "(1 :: int) < x"
  shows "(2 :: int) * (x cdiv (2 :: int)) = x"
  sorry
end
