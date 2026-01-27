theory gcd_BinaryGcd_gcd_even_oddqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem gcd_even_odd'vc:
  fixes v :: "int"
  fixes u :: "int"
  assumes fact0: "(0 :: int) \<le> v"
  assumes fact1: "(0 :: int) \<le> u"
  shows "gcd ((2 :: int) * u) ((2 :: int) * v + (1 :: int)) = gcd u ((2 :: int) * v + (1 :: int))"
  sorry
end
