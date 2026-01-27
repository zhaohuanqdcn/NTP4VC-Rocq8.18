theory gcd_vc_sp_BinaryGcd_div_nonnegqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div_nonneg'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "(0 :: int) \<le> n cdiv (2 :: int)"
  sorry
end
