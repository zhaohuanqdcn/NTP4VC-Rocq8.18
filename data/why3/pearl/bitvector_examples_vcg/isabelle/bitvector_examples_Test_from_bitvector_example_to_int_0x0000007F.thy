theory bitvector_examples_Test_from_bitvector_example_to_int_0x0000007F
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x0000007F:
  shows "uint ((4294967295 :: 32 word) >> unat (25 :: 32 word)) = (127 :: int)"
  sorry
end
