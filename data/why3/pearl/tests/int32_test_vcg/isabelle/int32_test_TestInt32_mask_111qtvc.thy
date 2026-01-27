theory int32_test_TestInt32_mask_111qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem mask_111'vc:
  fixes o1 :: "32 word"
  fixes x :: "32 word"
  fixes result :: "32 word"
  assumes fact0: "uint o1 = sint x"
  assumes fact1: "sint result = uint (o1 AND w32_of_int (7 :: int))"
  shows "(0 :: int) \<le> sint result"
  and "sint result < (8 :: int)"
  sorry
end
