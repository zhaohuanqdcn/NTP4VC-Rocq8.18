theory multiplication_MultiplicationSingle_multiplication_errors_basicqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem multiplication_errors_basic'vc:
  fixes a :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  shows "let exact :: real = to_real a * to_real b * to_real c in abs (to_real (umul (umul a b) c) - exact) \<le> ((2 :: Real.real) + eps) * eps * abs exact + eta * (abs (to_real c) * ((1 :: Real.real) + eps) + (1 :: Real.real))"
  sorry
end
