theory addition_AdditionSingle_addition_errors_basicqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem addition_errors_basic'vc:
  fixes a :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  shows "abs (to_real (uadd (uadd a b) c) - (to_real a + to_real b + to_real c)) \<le> (2 :: Real.real) * eps * (abs (to_real a) + abs (to_real b) + abs (to_real c))"
  sorry
end
