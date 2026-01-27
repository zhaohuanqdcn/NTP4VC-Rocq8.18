theory add_sub_mul_AddSubMulSingle_example2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem example2'vc:
  fixes a :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  shows "let t :: real = (1 :: Real.real) + eps; t1 :: real = eps + eps * t; t2 :: real = (to_real a + to_real b) * to_real c; t3 :: real = abs t2; t4 :: real = (t + t1) * eta in abs (to_real (uadd (umul (uadd a b) c) (umul (uadd a b) c)) - (t2 + t2)) \<le> (t1 + t1 + eps) * (t3 + t3) + (t4 + t4)"
  sorry
end
