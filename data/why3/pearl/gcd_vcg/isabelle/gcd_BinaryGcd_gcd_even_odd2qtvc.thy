theory gcd_BinaryGcd_gcd_even_odd2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem gcd_even_odd2'vc:
  fixes v :: "int"
  fixes u :: "int"
  assumes fact0: "(0 :: int) \<le> v"
  assumes fact1: "(0 :: int) \<le> u"
  assumes fact2: "even u"
  assumes fact3: "odd v"
  shows "gcd u v = gcd (u cdiv (2 :: int)) v"
  sorry
end
