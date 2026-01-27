theory add_sub_mul_AddSubMulSingle_determinantqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem determinant'vc:
  fixes a :: "usingle"
  fixes d :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  shows "let t1 :: real = to_real a * to_real d; t2 :: real = to_real b * to_real c in abs (to_real (usub (umul a d) (umul b c)) - (t1 - t2)) \<le> (3 :: Real.real) * eps * (abs t1 + abs t2) + (2 :: Real.real) * eta * ((1 :: Real.real) + (2 :: Real.real) * eps)"
  sorry
end
