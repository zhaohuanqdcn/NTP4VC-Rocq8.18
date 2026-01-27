theory euler_sieve_ArithmeticResults_div_croissance1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div_croissance1'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> j"
  assumes fact2: "(0 :: int) < n"
  shows "i ediv n \<le> j ediv n"
  sorry
end
