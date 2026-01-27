theory gcd_vc_sp_BinaryGcd_even1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem even1'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "even n \<longleftrightarrow> n = (2 :: int) * (n cdiv (2 :: int))"
  sorry
end
