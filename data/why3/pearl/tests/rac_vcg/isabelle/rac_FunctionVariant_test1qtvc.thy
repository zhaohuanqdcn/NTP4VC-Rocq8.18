theory rac_FunctionVariant_test1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test1'vc:
  fixes i :: "int"
  assumes fact0: "(0 :: int) < i"
  shows "(0 :: int) \<le> i"
  and "i - (1 :: int) < i"
  sorry
end
