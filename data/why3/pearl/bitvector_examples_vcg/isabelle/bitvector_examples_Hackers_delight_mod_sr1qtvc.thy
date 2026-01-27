theory bitvector_examples_Hackers_delight_mod_sr1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem sr1'vc:
  fixes n :: "32 word"
  fixes x :: "32 word"
  assumes fact0: "(0 :: 32 word) \<le> n"
  assumes fact1: "n \<le> (31 :: 32 word)"
  shows "(x >> unat n) OR (-(x >> unat (31 :: 32 word)) << unat ((31 :: 32 word) - n)) = x >>> unat n"
  sorry
end
