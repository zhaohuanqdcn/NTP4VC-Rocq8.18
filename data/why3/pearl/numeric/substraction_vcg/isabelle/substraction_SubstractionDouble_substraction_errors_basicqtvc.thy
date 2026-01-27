theory substraction_SubstractionDouble_substraction_errors_basicqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
theorem substraction_errors_basic'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  fixes c :: "udouble"
  shows "abs (to_real (usub (usub a b) c) - (to_real a - to_real b - to_real c)) \<le> (2 :: Real.real) * eps * (abs (to_real a) + abs (to_real b) + abs (to_real c))"
  sorry
end
