theory bitvector_examples_Hackers_delight_mod_bp3qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem bp3'vc:
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
  shows "let result :: 32 word = not x in not b \<le> result \<and> result \<le> not a"
  sorry
end
