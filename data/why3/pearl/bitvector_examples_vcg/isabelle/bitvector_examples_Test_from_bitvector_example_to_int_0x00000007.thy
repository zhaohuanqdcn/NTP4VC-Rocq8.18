theory bitvector_examples_Test_from_bitvector_example_to_int_0x00000007
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x00000007:
  shows "uint ((4294967295 :: 32 word) >> unat (29 :: 32 word)) = (7 :: int)"
  sorry
end
