theory euler_sieve_ArithmeticResults_div_croissance_locale1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div_croissance_locale1'vc:
  fixes i :: "int"
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "(0 :: int) < n"
  shows "i ediv n \<le> (i + (1 :: int)) ediv n"
  sorry
end
