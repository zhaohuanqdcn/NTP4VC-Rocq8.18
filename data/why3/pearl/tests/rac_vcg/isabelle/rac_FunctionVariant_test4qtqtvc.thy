theory rac_FunctionVariant_test4qtqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test4''vc:
  fixes j :: "int"
  shows "(0 :: int) \<le> j"
  and "j - (1 :: int) < j"
  sorry
end
