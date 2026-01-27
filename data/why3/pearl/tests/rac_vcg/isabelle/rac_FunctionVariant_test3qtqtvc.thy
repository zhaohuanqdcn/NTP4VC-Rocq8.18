theory rac_FunctionVariant_test3qtqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test3''vc:
  fixes j :: "int"
  assumes fact0: "\<not>j = (0 :: int)"
  shows "(0 :: int) \<le> j"
  and "j - (1 :: int) < j"
  sorry
end
