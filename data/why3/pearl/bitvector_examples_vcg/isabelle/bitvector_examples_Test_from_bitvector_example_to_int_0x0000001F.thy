theory bitvector_examples_Test_from_bitvector_example_to_int_0x0000001F
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x0000001F:
  shows "uint ((4294967295 :: 32 word) >> unat (27 :: 32 word)) = (31 :: int)"
  sorry
end
