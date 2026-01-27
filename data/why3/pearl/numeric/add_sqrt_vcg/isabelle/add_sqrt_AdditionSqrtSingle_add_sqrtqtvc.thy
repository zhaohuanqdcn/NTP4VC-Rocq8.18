theory add_sqrt_AdditionSqrtSingle_add_sqrtqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
consts usqrt :: "usingle \<Rightarrow> usingle"
theorem add_sqrt'vc:
  fixes a :: "usingle"
  fixes b :: "usingle"
  shows "let exact :: real = to_real a + to_real (usqrt b) in abs (to_real (uadd a (usqrt b)) - exact) \<le> eps * abs exact"
  sorry
end
