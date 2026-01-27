theory gcd_BinaryGcd_gcd_odd_odd2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem gcd_odd_odd2'vc:
  fixes v :: "int"
  fixes u :: "int"
  assumes fact0: "(0 :: int) \<le> v"
  assumes fact1: "v \<le> u"
  assumes fact2: "odd u"
  assumes fact3: "odd v"
  shows "gcd u v = gcd ((u - v) cdiv (2 :: int)) v"
  sorry
end
