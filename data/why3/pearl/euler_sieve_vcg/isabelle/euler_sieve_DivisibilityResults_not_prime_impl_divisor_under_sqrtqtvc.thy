theory euler_sieve_DivisibilityResults_not_prime_impl_divisor_under_sqrtqtvc
  imports "NTP4Verif.NTP4Verif" "./euler_sieve_ArithmeticResults"
begin
theorem not_prime_impl_divisor_under_sqrt'vc:
  fixes n :: "int"
  fixes i :: "int"
  assumes fact0: "(2 :: int) \<le> n"
  assumes fact1: "(2 :: int) \<le> i"
  assumes fact2: "i < n * n"
  assumes fact3: "\<not>prime i"
  shows "\<exists>(j :: int). ((2 :: int) \<le> j \<and> j < i) \<and> j < n \<and> j dvd i"
  sorry
end
