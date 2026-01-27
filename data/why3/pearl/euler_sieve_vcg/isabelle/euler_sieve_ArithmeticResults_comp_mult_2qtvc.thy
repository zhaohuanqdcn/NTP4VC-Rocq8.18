theory euler_sieve_ArithmeticResults_comp_mult_2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem comp_mult_2'vc:
  fixes n :: "int"
  fixes k :: "int"
  assumes fact0: "(0 :: int) < n"
  assumes fact1: "(2 :: int) \<le> k"
  shows "n * (2 :: int) \<le> n * k"
  sorry
end
