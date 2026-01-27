theory addition_AdditionSingle_addition_errorsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem addition_errors'vc:
  fixes a :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  fixes d :: "usingle"
  fixes e :: "usingle"
  fixes f :: "usingle"
  shows "abs (to_real (uadd (uadd (uadd a b) c) (uadd d (uadd e f))) - (to_real a + to_real b + to_real c + to_real d + to_real e + to_real f)) \<le> (5 :: Real.real) * eps * (abs (to_real a) + abs (to_real b) + abs (to_real c) + abs (to_real d) + abs (to_real e) + abs (to_real f))"
  sorry
end
