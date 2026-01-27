theory bitvector_examples_Test_from_bitvector_example_lsr20qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr20'vc:
  shows "uint ((4294967295 :: 32 word) >> unat (20 :: 32 word)) = (4095 :: int)"
  sorry
end
