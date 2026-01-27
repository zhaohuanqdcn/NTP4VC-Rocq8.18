theory bitvector_examples_Hackers_delight_DMtest
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DMtest:
  fixes x :: "32 word"
  shows "(0 :: 32 word) = not (x OR -(x + (1 :: 32 word)))"
  sorry
end
