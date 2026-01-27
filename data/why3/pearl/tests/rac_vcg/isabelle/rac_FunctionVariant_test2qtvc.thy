theory rac_FunctionVariant_test2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test2'vc:
  fixes i :: "int"
  shows "(0 :: int) < i"
  and "(0 :: int) \<le> i"
  and "i - (1 :: int) < i"
  sorry
end
