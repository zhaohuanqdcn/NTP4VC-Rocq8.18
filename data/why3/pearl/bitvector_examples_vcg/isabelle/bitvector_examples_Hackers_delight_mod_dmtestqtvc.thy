theory bitvector_examples_Hackers_delight_mod_dmtestqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem dmtest'vc:
  fixes x :: "32 word"
  shows "not (x OR -(x + (1 :: 32 word))) = (0 :: 32 word)"
  sorry
end
