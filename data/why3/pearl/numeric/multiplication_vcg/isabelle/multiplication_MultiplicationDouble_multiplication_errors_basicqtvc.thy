theory multiplication_MultiplicationDouble_multiplication_errors_basicqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
theorem multiplication_errors_basic'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  fixes c :: "udouble"
  shows "let exact :: real = to_real a * to_real b * to_real c in abs (to_real (umul (umul a b) c) - exact) \<le> ((2 :: Real.real) + eps) * eps * abs exact + eta * (abs (to_real c) * ((1 :: Real.real) + eps) + (1 :: Real.real))"
  sorry
end
