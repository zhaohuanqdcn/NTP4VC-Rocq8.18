theory isqrt_Square_sqr_sumqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition sqr :: "int \<Rightarrow> int"
  where "sqr x = x * x" for x
theorem sqr_sum'vc:
  fixes x :: "int"
  fixes y :: "int"
  shows "sqr (x + y) = sqr x + (2 :: int) * x * y + sqr y"
  sorry
end
