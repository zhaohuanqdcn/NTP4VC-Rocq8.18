theory strassen_MaxFun_maxfqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem maxf'vc:
  fixes b :: "int"
  fixes a :: "int"
  assumes fact0: "\<not>b \<le> a"
  shows "(0 :: int) \<le> b - a"
  and "b - (1 :: int) - a < b - a"
  sorry
end
