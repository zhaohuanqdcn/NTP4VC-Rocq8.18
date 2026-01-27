theory bitvector_examples_Hackers_delight_BP3
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem BP3:
  fixes a :: "32 word"
  fixes x :: "32 word"
  fixes b :: "32 word"
  fixes c :: "32 word"
  fixes y :: "32 word"
  fixes d :: "32 word"
  assumes fact0: "a \<le> x"
  assumes fact1: "x \<le> b"
  assumes fact2: "c \<le> y"
  assumes fact3: "y \<le> d"
  shows "not b \<le> not x"
  and "not x \<le> not a"
  sorry
end
