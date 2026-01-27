theory bitvector_examples_Hackers_delight_DM1
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DM1:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "not (x AND y) = not x OR not y"
  sorry
end
