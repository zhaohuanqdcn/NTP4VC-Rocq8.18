theory bitvector_examples_Hackers_delight_mod_dm3qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem dm3'vc:
  fixes x :: "32 word"
  shows "not (x + (1 :: 32 word)) = not x - (1 :: 32 word)"
  sorry
end
