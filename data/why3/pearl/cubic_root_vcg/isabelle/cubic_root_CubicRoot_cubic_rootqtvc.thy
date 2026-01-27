theory cubic_root_CubicRoot_cubic_rootqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition cube :: "int \<Rightarrow> int"
  where "cube x = x * x * x" for x
theorem cubic_root'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  shows "cube ((1 :: int) - (1 :: int)) \<le> x"
  and "(1 :: int) = cube (1 :: int)"
  and "(1 :: int) = (1 :: int) * (1 :: int)"
  and "\<forall>(b :: int). cube (b - (1 :: int)) \<le> x \<longrightarrow> (if cube b \<le> x then ((0 :: int) \<le> x - cube b \<and> x - (cube b + (3 :: int) * (b * b) + (3 :: int) * b + (1 :: int)) < x - cube b) \<and> cube (b + (1 :: int) - (1 :: int)) \<le> x \<and> cube b + (3 :: int) * (b * b) + (3 :: int) * b + (1 :: int) = cube (b + (1 :: int)) \<and> b * b + (2 :: int) * b + (1 :: int) = (b + (1 :: int)) * (b + (1 :: int)) else cube (b - (1 :: int)) \<le> x \<and> x < cube b)"
  sorry
end
