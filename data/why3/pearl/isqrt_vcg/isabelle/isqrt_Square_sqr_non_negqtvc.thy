theory isqrt_Square_sqr_non_negqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition sqr :: "int \<Rightarrow> int"
  where "sqr x = x * x" for x
theorem sqr_non_neg'vc:
  fixes x :: "int"
  shows "(0 :: int) \<le> sqr x"
  sorry
end
