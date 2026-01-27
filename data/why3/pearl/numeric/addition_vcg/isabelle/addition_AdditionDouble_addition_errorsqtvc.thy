theory addition_AdditionDouble_addition_errorsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
theorem addition_errors'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  fixes c :: "udouble"
  fixes d :: "udouble"
  fixes e :: "udouble"
  fixes f :: "udouble"
  shows "abs (to_real (uadd (uadd (uadd a b) c) (uadd d (uadd e f))) - (to_real a + to_real b + to_real c + to_real d + to_real e + to_real f)) \<le> (5 :: Real.real) * eps * (abs (to_real a) + abs (to_real b) + abs (to_real c) + abs (to_real d) + abs (to_real e) + abs (to_real f))"
  sorry
end
