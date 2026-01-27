theory bitvector_examples_Test_from_bitvector_example_lsr31qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr31'vc:
  shows "(4294967295 :: 32 word) >> unat (31 :: 32 word) = (1 :: 32 word)"
  sorry
end
