theory euler_sieve_DivisibilityResults_not_prime_divider_limitsqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem not_prime_divider_limits'vc:
  fixes n :: "int"
  assumes fact0: "\<not>prime n"
  assumes fact1: "(2 :: int) \<le> n"
  shows "\<exists>(i :: int). (2 :: int) \<le> i \<and> i * i \<le> n \<and> i dvd n"
  sorry
end
