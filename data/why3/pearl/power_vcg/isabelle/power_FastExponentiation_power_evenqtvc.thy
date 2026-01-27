theory power_FastExponentiation_power_evenqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem power_even'vc:
  fixes n :: "int"
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "n cmod (2 :: int) = (0 :: int)"
  shows "x ^\<^sub>i n = (x * x) ^\<^sub>i (n cdiv (2 :: int))"
  sorry
end
