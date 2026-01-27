theory bitvector_examples_Hackers_delight_IE2
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem IE2:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "x AND y \<le> not (x XOR y)"
  sorry
end
