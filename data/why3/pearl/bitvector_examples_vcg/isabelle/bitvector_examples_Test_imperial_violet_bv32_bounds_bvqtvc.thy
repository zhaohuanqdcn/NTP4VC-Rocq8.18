theory bitvector_examples_Test_imperial_violet_bv32_bounds_bvqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem bv32_bounds_bv'vc:
  fixes b :: "32 word"
  shows "(0 :: 32 word) \<le> b"
  and "b \<le> (4294967295 :: 32 word)"
  sorry
end
