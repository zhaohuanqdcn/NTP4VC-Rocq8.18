theory euler_sieve_ArithmeticResults_div_croissance2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div_croissance2'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes m :: "int"
  assumes fact0: "(0 :: int) < i"
  assumes fact1: "i \<le> j"
  assumes fact2: "(0 :: int) \<le> m"
  shows "m ediv j \<le> m ediv i"
  sorry
end
