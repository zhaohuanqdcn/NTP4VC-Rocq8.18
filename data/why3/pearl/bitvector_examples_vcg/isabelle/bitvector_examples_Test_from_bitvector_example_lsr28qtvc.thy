theory bitvector_examples_Test_from_bitvector_example_lsr28qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr28'vc:
  shows "uint ((4294967295 :: 32 word) >> unat (28 :: 32 word)) = (15 :: int)"
  sorry
end
