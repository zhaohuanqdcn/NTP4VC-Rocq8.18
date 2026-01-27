theory bitvector_examples_Test_from_bitvector_example_to_int_0x000001FF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x000001FF:
  shows "uint ((4294967295 :: 32 word) >> unat (23 :: 32 word)) = (511 :: int)"
  sorry
end
