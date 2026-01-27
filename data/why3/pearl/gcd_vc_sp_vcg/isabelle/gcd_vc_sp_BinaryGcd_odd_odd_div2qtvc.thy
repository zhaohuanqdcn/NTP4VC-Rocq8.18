theory gcd_vc_sp_BinaryGcd_odd_odd_div2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem odd_odd_div2'vc:
  fixes v :: "int"
  fixes u :: "int"
  assumes fact0: "(0 :: int) \<le> v"
  assumes fact1: "(0 :: int) \<le> u"
  shows "((2 :: int) * u + (1 :: int) - ((2 :: int) * v + (1 :: int))) cdiv (2 :: int) = u - v"
  sorry
end
