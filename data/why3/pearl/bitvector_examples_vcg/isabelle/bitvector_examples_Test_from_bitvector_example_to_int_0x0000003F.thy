theory bitvector_examples_Test_from_bitvector_example_to_int_0x0000003F
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0x0000003F:
  shows "uint ((4294967295 :: 32 word) >> unat (26 :: 32 word)) = (63 :: int)"
  sorry
end
