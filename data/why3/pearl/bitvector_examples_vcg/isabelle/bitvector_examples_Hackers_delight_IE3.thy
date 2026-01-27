theory bitvector_examples_Hackers_delight_IE3
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem IE3:
  fixes x :: "32 word"
  fixes y :: "32 word"
  assumes fact0: "x \<le> x + y"
  assumes fact1: "y \<le> x + y"
  shows "x OR y \<le> x + y"
  sorry
end
