theory bitvector_examples_Hackers_delight_mod_ie1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem ie1'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "x XOR y \<le> x OR y"
  sorry
end
