theory mutual_recursion_Top_f1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem f1'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "\<not>n = (0 :: int)"
  shows "(0 :: int) \<le> (1 :: int)"
  and "(0 :: int) < (1 :: int)"
  and "(1 :: int) \<le> n"
  sorry
end
