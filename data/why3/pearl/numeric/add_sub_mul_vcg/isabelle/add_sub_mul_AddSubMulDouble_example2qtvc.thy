theory add_sub_mul_AddSubMulDouble_example2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
theorem example2'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  fixes c :: "udouble"
  shows "let t :: real = (1 :: Real.real) + eps; t1 :: real = eps + eps * t; t2 :: real = (to_real a + to_real b) * to_real c; t3 :: real = abs t2; t4 :: real = (t + t1) * eta in abs (to_real (uadd (umul (uadd a b) c) (umul (uadd a b) c)) - (t2 + t2)) \<le> (t1 + t1 + eps) * (t3 + t3) + (t4 + t4)"
  sorry
end
