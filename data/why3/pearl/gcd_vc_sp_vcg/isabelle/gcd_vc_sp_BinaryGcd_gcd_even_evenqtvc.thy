theory gcd_vc_sp_BinaryGcd_gcd_even_evenqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem gcd_even_even'vc:
  fixes v :: "int"
  fixes u :: "int"
  assumes fact0: "(0 :: int) \<le> v"
  assumes fact1: "(0 :: int) \<le> u"
  shows "gcd ((2 :: int) * u) ((2 :: int) * v) = (2 :: int) * gcd u v"
  sorry
end
