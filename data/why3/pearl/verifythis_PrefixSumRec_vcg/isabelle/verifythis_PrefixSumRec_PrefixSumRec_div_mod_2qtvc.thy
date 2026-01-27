theory verifythis_PrefixSumRec_PrefixSumRec_div_mod_2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Sum"
begin
theorem div_mod_2'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  shows "(2 :: int) * (x cdiv (2 :: int)) \<le> x"
  and "x - (1 :: int) \<le> (2 :: int) * (x cdiv (2 :: int))"
  sorry
end
