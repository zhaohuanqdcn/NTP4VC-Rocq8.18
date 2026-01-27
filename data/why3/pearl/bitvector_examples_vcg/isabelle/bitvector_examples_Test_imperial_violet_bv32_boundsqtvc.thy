theory bitvector_examples_Test_imperial_violet_bv32_boundsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem bv32_bounds'vc:
  fixes b :: "32 word"
  shows "(0 :: int) \<le> uint b"
  and "uint b < (4294967296 :: int)"
  sorry
end
