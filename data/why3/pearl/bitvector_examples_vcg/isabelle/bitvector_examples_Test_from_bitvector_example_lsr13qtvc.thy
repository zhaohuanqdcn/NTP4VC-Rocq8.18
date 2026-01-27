theory bitvector_examples_Test_from_bitvector_example_lsr13qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr13'vc:
  shows "uint ((4294967295 :: 32 word) >> unat (13 :: 32 word)) = (524287 :: int)"
  sorry
end
