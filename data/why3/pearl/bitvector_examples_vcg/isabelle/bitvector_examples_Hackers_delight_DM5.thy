theory bitvector_examples_Hackers_delight_DM5
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DM5:
  fixes x :: "32 word"
  shows "not (-x) = x - (1 :: 32 word)"
  sorry
end
