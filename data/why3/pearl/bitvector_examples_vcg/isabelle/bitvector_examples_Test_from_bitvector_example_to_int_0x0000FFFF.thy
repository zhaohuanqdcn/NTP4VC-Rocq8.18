theory bitvector_examples_Test_from_bitvector_example_to_int_0x0000FFFF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x0000FFFF:
  shows "uint ((4294967295 :: 32 word) >> unat (16 :: 32 word)) = (65535 :: int)"
  sorry
end
