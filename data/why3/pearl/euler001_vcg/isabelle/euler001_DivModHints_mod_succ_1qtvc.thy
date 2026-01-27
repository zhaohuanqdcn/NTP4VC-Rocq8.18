theory euler001_DivModHints_mod_succ_1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mod_succ_1'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "(0 :: int) < y"
  assumes fact2: "\<not>(x + (1 :: int)) cmod y = (0 :: int)"
  shows "(x + (1 :: int)) cmod y = x cmod y + (1 :: int)"
  sorry
end
