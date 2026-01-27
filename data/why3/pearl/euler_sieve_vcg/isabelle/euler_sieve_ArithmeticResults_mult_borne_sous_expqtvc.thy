theory euler_sieve_ArithmeticResults_mult_borne_sous_expqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mult_borne_sous_exp'vc:
  fixes a :: "int"
  fixes b :: "int"
  fixes n :: "int"
  assumes fact0: "(1 :: int) \<le> a"
  assumes fact1: "(1 :: int) \<le> b"
  assumes fact2: "(1 :: int) \<le> n"
  assumes fact3: "a * b < n"
  shows "a < n"
  and "b < n"
  sorry
end
