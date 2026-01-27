theory fact_vc_sp_FactRecursive_fact_recqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Fact"
begin
theorem fact_rec'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  shows "\<not>x = (0 :: int) \<longrightarrow> (let o1 :: int = x - (1 :: int) in ((0 :: int) \<le> x \<and> o1 < x) \<and> (0 :: int) \<le> o1)"
  and "\<forall>(result :: int). (if x = (0 :: int) then result = (1 :: int) else result = x * fact (x - (1 :: int))) \<longrightarrow> result = fact x"
  sorry
end
