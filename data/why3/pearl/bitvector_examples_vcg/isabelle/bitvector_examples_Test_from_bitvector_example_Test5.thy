theory bitvector_examples_Test_from_bitvector_example_Test5
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem Test5:
  shows "(take_bit (unat (16 :: 32 word)) ((4294967295 :: 32 word) >>> unat (16 :: 32 word)) \<noteq> (0)) = True"
  sorry
end
