theory euler_sieve_ArithmeticResults_mult_croissanceqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mult_croissance'vc:
  fixes n :: "int"
  fixes a :: "int"
  fixes b :: "int"
  assumes fact0: "(0 :: int) < n"
  assumes fact1: "(0 :: int) \<le> a"
  assumes fact2: "a < b"
  shows "n * a < n * b"
  sorry
end
