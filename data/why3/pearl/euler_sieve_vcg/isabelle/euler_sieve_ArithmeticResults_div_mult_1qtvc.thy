theory euler_sieve_ArithmeticResults_div_mult_1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div_mult_1'vc:
  fixes n :: "int"
  fixes max :: "int"
  fixes k :: "int"
  assumes fact0: "(0 :: int) < n"
  assumes fact1: "n \<le> max"
  assumes fact2: "n * k \<le> max"
  shows "k = n * k ediv n"
  and "n * k ediv n \<le> max ediv n"
  sorry
end
