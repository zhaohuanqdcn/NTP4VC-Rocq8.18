theory euler_sieve_ArithmeticResults_sq_ineqqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem sq_ineq'vc:
  fixes a :: "int"
  fixes b :: "int"
  assumes fact0: "(0 :: int) \<le> a"
  assumes fact1: "(0 :: int) \<le> b"
  assumes fact2: "a * a < b * b"
  shows "a < b"
  sorry
end
