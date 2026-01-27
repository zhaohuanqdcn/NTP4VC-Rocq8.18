theory isqrt_Square_sqr_increasingqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition sqr :: "int \<Rightarrow> int"
  where "sqr x = x * x" for x
theorem sqr_increasing'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "x \<le> y"
  shows "sqr x \<le> sqr y"
  sorry
end
