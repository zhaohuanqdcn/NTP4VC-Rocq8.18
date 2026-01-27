theory hillel_challenge_FulcrumNoOverflow_bigqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
theorem big'vc:
  shows "-((2147483647 :: int) + (1 :: int)) \<le> (0 :: int)"
  and "(0 :: int) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)"
  and "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) \<le> (2147483647 :: int) + (1 :: int) - (1 :: int)"
  and "(0 :: int) = (0 :: int) * ((2147483647 :: int) + (1 :: int)) + (0 :: int)"
  sorry
end
