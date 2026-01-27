theory euler_sieve_ArithmeticResults_mult_croissance_localeqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mult_croissance_locale'vc:
  fixes n :: "int"
  fixes a :: "int"
  assumes fact0: "(0 :: int) < n"
  assumes fact1: "(0 :: int) \<le> a"
  shows "n * a < n * (a + (1 :: int))"
  sorry
end
