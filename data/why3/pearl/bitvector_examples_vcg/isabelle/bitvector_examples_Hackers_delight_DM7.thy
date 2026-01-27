theory bitvector_examples_Hackers_delight_DM7
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DM7:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "not (x + y) = not x - y"
  sorry
end
