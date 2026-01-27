theory bitvector_examples_Hackers_delight_mod_dm6qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem dm6'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "not (x XOR y) = not x XOR y"
  sorry
end
