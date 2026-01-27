theory gcd_BinaryGcd_odd1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem odd1'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "\<not>even n \<longleftrightarrow> n = (2 :: int) * (n cdiv (2 :: int)) + (1 :: int)"
  sorry
end
