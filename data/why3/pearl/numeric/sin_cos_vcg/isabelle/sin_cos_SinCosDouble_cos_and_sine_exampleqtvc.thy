theory sin_cos_SinCosDouble_cos_and_sine_exampleqtvc
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
theorem cos_and_sine_example'vc:
  fixes a :: "udouble"
  assumes fact0: "abs (to_real a) \<le> sin_max"
  assumes fact1: "abs (to_real a) \<le> cos_max"
  shows "abs (to_real a) \<le> sin_max"
  and "\<forall>(o1 :: udouble). abs (to_real o1 - sin (to_real a)) \<le> sin_rel_err * abs (sin (to_real a)) + sin_abs_err \<longrightarrow> abs (to_real a) \<le> sin_max \<and> (\<forall>(o2 :: udouble). abs (to_real o2 - sin (to_real a)) \<le> sin_rel_err * abs (sin (to_real a)) + sin_abs_err \<longrightarrow> abs (to_real a) \<le> cos_max \<and> (\<forall>(o3 :: udouble). abs (to_real o3 - cos (to_real a)) \<le> cos_rel_err * abs (cos (to_real a)) + cos_abs_err \<longrightarrow> abs (to_real a) \<le> cos_max \<and> (\<forall>(o4 :: udouble). abs (to_real o4 - cos (to_real a)) \<le> cos_rel_err * abs (cos (to_real a)) + cos_abs_err \<longrightarrow> (let a1 :: real = to_real a; t :: real = (1 :: Real.real) + eps; crel :: real = eps + cos_rel_err * ((2 :: Real.real) + cos_rel_err) * t; srel :: real = eps + sin_rel_err * ((2 :: Real.real) + sin_rel_err) * t in abs (to_real (uadd (umul o4 o3) (umul o2 o1)) - (1 :: Real.real)) \<le> crel + srel + eps + (t + srel) * (t * cos_abs_err * ((2 :: Real.real) * ((1 :: Real.real) + cos_rel_err) * abs (cos a1) + cos_abs_err) + eta) + (t + crel) * (t * sin_abs_err * ((2 :: Real.real) * ((1 :: Real.real) + sin_rel_err) * abs (sin a1) + sin_abs_err) + eta)))))"
  sorry
end
