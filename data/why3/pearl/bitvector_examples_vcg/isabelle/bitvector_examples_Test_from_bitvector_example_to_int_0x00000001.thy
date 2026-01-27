theory bitvector_examples_Test_from_bitvector_example_to_int_0x00000001
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x00000001:
  shows "uint ((4294967295 :: 32 word) >> unat (31 :: 32 word)) = (1 :: int)"
  sorry
end
