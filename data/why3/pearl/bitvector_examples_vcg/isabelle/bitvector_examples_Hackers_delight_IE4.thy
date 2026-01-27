theory bitvector_examples_Hackers_delight_IE4
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem IE4:
  fixes x :: "32 word"
  fixes y :: "32 word"
  assumes fact0: "\<not>(x \<le> x + y \<and> y \<le> x + y)"
  shows "x OR y > x + y"
  sorry
end
