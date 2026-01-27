theory bitvector_examples_Test_from_bitvector_example_to_int_0x00000FFF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x00000FFF:
  shows "uint ((4294967295 :: 32 word) >> unat (20 :: 32 word)) = (4095 :: int)"
  sorry
end
