theory bitvector_examples_Test_from_bitvector_example_to_int_0x000003FF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x000003FF:
  shows "uint ((4294967295 :: 32 word) >> unat (22 :: 32 word)) = (1023 :: int)"
  sorry
end
