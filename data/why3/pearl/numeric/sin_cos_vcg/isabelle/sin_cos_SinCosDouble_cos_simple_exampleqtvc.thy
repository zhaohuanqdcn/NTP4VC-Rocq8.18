theory sin_cos_SinCosDouble_cos_simple_exampleqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
consts sin_rel_err :: "real"
axiomatization where sin_rel_err_range:   "(0 :: Real.real) \<le> sin_rel_err"
consts sin_abs_err :: "real"
axiomatization where sin_abs_err_range:   "(0 :: Real.real) \<le> sin_abs_err"
consts sin_max :: "real"
axiomatization where sin_max_range:   "(0 :: Real.real) \<le> sin_max"
consts cos_rel_err :: "real"
axiomatization where cos_rel_err_range:   "(0 :: Real.real) \<le> cos_rel_err"
consts cos_abs_err :: "real"
axiomatization where cos_abs_err_range:   "(0 :: Real.real) \<le> cos_abs_err"
consts cos_max :: "real"
axiomatization where cos_max_range:   "(0 :: Real.real) \<le> cos_max"
theorem cos_simple_example'vc:
  fixes a :: "udouble"
  fixes b :: "udouble"
  assumes fact0: "abs (to_real a) \<le> (1 :: Real.real) / (4) * cos_max"
  assumes fact1: "abs (to_real b) \<le> (1 :: Real.real) / (4) * cos_max"
  shows "let o1 :: udouble = usub a b in abs (to_real o1) \<le> cos_max \<and> (\<forall>(result :: udouble). abs (to_real result - cos (to_real o1)) \<le> cos_rel_err * abs (cos (to_real o1)) + cos_abs_err \<longrightarrow> abs (to_real result - cos (to_real a - to_real b)) \<le> cos_rel_err * abs (cos (to_real a - to_real b)) + eps * abs (to_real a - to_real b) * ((1 :: Real.real) + cos_rel_err) + cos_abs_err)"
  sorry
end
