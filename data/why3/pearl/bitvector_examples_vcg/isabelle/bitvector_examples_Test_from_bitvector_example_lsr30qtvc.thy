theory bitvector_examples_Test_from_bitvector_example_lsr30qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr30'vc:
  shows "(4294967295 :: 32 word) >> unat (30 :: 32 word) = (3 :: 32 word)"
  sorry
end
