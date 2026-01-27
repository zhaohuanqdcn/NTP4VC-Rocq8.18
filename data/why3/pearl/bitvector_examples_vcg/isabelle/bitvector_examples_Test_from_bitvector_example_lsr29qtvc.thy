theory bitvector_examples_Test_from_bitvector_example_lsr29qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr29'vc:
  shows "uint ((4294967295 :: 32 word) >> unat (29 :: 32 word)) = (7 :: int)"
  sorry
end
