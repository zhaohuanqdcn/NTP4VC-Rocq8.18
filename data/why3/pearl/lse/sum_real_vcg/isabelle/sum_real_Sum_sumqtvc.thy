theory sum_real_Sum_sumqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem sum'vc:
  fixes b :: "int"
  fixes a :: "int"
  assumes fact0: "\<not>b \<le> a"
  shows "(0 :: int) \<le> b - a"
  and "b - (1 :: int) - a < b - a"
  sorry
end
