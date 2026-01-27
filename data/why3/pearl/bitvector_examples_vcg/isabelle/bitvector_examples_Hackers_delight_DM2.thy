theory bitvector_examples_Hackers_delight_DM2
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DM2:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "not (x OR y) = not x AND not y"
  sorry
end
