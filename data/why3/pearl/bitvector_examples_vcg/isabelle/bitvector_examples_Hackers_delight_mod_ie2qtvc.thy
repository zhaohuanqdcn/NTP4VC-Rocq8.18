theory bitvector_examples_Hackers_delight_mod_ie2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem ie2'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "x AND y \<le> not (x XOR y)"
  sorry
end
