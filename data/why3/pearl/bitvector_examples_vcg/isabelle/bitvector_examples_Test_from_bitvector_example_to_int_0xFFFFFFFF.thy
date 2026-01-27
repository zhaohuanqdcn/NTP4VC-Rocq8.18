theory bitvector_examples_Test_from_bitvector_example_to_int_0xFFFFFFFF
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_0xFFFFFFFF:
  shows "uint (4294967295 :: 32 word) = (4294967295 :: int)"
  sorry
end
