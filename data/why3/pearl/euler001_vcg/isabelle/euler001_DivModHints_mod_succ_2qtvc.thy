theory euler001_DivModHints_mod_succ_2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mod_succ_2'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "(0 :: int) < y"
  assumes fact2: "(x + (1 :: int)) cmod y = (0 :: int)"
  shows "x cmod y = y - (1 :: int)"
  sorry
end
