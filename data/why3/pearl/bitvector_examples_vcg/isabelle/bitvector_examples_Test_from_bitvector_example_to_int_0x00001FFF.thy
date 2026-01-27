theory bitvector_examples_Test_from_bitvector_example_to_int_0x00001FFF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x00001FFF:
  shows "uint ((4294967295 :: 32 word) >> unat (19 :: 32 word)) = (8191 :: int)"
  sorry
end
