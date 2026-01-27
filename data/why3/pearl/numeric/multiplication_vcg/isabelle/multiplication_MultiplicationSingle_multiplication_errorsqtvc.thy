theory multiplication_MultiplicationSingle_multiplication_errorsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem multiplication_errors'vc:
  fixes d :: "usingle"
  fixes e :: "usingle"
  fixes f :: "usingle"
  fixes a :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  shows "let t :: real = (1 :: Real.real) + eps; t3 :: real = eps + eps * t; t4 :: real = to_real d * (to_real e * to_real f); t5 :: real = to_real a * to_real b * to_real c; t6 :: real = eta * abs (to_real d) * t + eta; t7 :: real = eta * abs (to_real c) * t + eta; exact :: real = t5 * t4 in abs (to_real (umul (umul (umul a b) c) (umul d (umul e f))) - exact) \<le> (eps + (t3 + t3 + t3 * t3) * t) * abs exact + ((t6 + t6 * t3) * abs t5 + (t7 + t7 * t3) * abs t4 + t7 * t6) * t + eta"
  sorry
end
