theory bitvector_examples_Test_from_bitvector_example_to_int_0x00007FFF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x00007FFF:
  shows "uint ((4294967295 :: 32 word) >> unat (17 :: 32 word)) = (32767 :: int)"
  sorry
end
