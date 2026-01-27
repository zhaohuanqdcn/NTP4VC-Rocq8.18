theory bitvector_examples_Hackers_delight_DM3
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DM3:
  fixes x :: "32 word"
  shows "not (x + (1 :: 32 word)) = not x - (1 :: 32 word)"
  sorry
end
