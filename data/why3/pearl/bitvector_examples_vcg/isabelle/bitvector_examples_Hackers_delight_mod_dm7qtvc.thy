theory bitvector_examples_Hackers_delight_mod_dm7qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem dm7'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "not (x + y) = not x - y"
  sorry
end
