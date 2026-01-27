theory rac_FunctionVariant_test3qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test3'vc:
  fixes i :: "int"
  assumes fact0: "\<not>i = (0 :: int)"
  shows "(0 :: int) \<le> i"
  and "i - (1 :: int) < i"
  sorry
end
