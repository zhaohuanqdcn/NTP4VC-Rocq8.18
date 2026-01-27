theory add_sqrt_AdditionSqrtDouble_add_sqrtqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
consts usqrt :: "udouble \<Rightarrow> udouble"
theorem add_sqrt'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  shows "let exact :: real = to_real a + to_real (usqrt b) in abs (to_real (uadd a (usqrt b)) - exact) \<le> eps * abs exact"
  sorry
end
