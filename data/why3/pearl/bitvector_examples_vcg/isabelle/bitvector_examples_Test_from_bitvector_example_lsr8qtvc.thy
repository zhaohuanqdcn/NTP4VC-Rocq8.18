theory bitvector_examples_Test_from_bitvector_example_lsr8qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem lsr8'vc:
  shows "uint ((4294967295 :: 32 word) >> unat (8 :: 32 word)) = (16777215 :: int)"
  sorry
end
