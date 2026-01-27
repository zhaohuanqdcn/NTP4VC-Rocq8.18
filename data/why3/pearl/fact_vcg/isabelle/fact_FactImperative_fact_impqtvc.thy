theory fact_FactImperative_fact_impqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Fact"
begin
theorem fact_imp'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> x"
  and "(1 :: int) = fact (0 :: int)"
  and "\<forall>(y :: int). (0 :: int) \<le> y \<and> y \<le> x \<longrightarrow> (if y < x then ((0 :: int) \<le> x - y \<and> x - (y + (1 :: int)) < x - y) \<and> ((0 :: int) \<le> y + (1 :: int) \<and> y + (1 :: int) \<le> x) \<and> fact y * (y + (1 :: int)) = fact (y + (1 :: int)) else fact y = fact x)"
  sorry
end
