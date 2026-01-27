theory euler_sieve_ArithmeticResults_div_croissance_locale2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div_croissance_locale2'vc:
  fixes i :: "int"
  fixes m :: "int"
  assumes fact0: "(0 :: int) < i"
  assumes fact1: "(0 :: int) \<le> m"
  shows "m ediv (i + (1 :: int)) \<le> m ediv i"
  sorry
end
