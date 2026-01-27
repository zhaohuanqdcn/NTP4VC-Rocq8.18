theory valuation_Valuation_valuationqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem valuation'vc:
  fixes p :: "int"
  fixes n :: "int"
  assumes fact0: "(1 :: int) < p"
  assumes fact1: "(1 :: int) \<le> n"
  shows "\<not>p = (0 :: int)"
  and "let o1 :: int = n cmod p in (o1 = (0 :: int) \<longrightarrow> \<not>p = (0 :: int) \<and> (let d :: int = n cdiv p in ((0 :: int) \<le> n \<and> d < n) \<and> (1 :: int) < p \<and> (1 :: int) \<le> d)) \<and> (\<forall>(result :: int). (if o1 = (0 :: int) then \<exists>(r :: int). ((0 :: int) \<le> r \<and> p ^\<^sub>i r dvd n cdiv p) \<and> result = r + (1 :: int) else result = (0 :: int)) \<longrightarrow> (0 :: int) \<le> result \<and> p ^\<^sub>i result dvd n)"
  sorry
end
