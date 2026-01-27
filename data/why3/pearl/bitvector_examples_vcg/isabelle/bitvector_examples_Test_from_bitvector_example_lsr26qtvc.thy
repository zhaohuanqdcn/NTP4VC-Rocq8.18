theory bitvector_examples_Test_from_bitvector_example_lsr26qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr26'vc:
  shows "uint ((4294967295 :: 32 word) >> unat (26 :: 32 word)) = (63 :: int)"
  sorry
end
