theory add_sub_mul_AddSubMulDouble_square_normqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
theorem square_norm'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  fixes c :: "udouble"
  shows "let t1 :: real = to_real a * to_real a; t2 :: real = to_real b * to_real b; t3 :: real = to_real c * to_real c in abs (to_real (uadd (uadd (umul a a) (umul b b)) (umul c c)) - (t1 + t2 + t3)) \<le> (5 :: Real.real) * eps * (t1 + t2 + t3) + eta * ((2 :: Real.real) * ((1 :: Real.real) + (2 :: Real.real) * eps) * ((1 :: Real.real) + (2 :: Real.real) * eps) + (1 :: Real.real) + (4 :: Real.real) * eps)"
  sorry
end
