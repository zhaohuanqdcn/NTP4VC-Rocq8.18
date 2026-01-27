theory gcd_vc_sp_BinaryGcd_gcd_odd_oddqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem gcd_odd_odd'vc:
  fixes v :: "int"
  fixes u :: "int"
  assumes fact0: "(0 :: int) \<le> v"
  assumes fact1: "v \<le> u"
  shows "gcd ((2 :: int) * u + (1 :: int)) ((2 :: int) * v + (1 :: int)) = gcd (u - v) ((2 :: int) * v + (1 :: int))"
  sorry
end
