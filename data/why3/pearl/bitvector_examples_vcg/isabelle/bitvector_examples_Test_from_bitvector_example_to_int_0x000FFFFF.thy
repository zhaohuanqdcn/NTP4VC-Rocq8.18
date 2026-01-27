theory bitvector_examples_Test_from_bitvector_example_to_int_0x000FFFFF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x000FFFFF:
  shows "uint ((4294967295 :: 32 word) >> unat (12 :: 32 word)) = (1048575 :: int)"
  sorry
end
