theory bitvector_examples_Hackers_delight_DM6
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem DM6:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "not (x XOR y) = not x XOR y"
  sorry
end
