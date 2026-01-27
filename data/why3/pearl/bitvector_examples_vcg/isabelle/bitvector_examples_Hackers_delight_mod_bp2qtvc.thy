theory bitvector_examples_Hackers_delight_mod_bp2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem bp2'vc:
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
  assumes fact4: "b \<le> b + d"
  assumes fact5: "d \<le> b + d"
  shows "let result :: 32 word = x XOR y in (0 :: 32 word) \<le> result \<and> result \<le> b + d"
  sorry
end
