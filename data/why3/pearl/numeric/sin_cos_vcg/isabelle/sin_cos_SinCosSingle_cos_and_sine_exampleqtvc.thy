theory sin_cos_SinCosSingle_cos_and_sine_exampleqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
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
  fixes a :: "usingle"
  assumes fact0: "abs (to_real a) \<le> sin_max"
  assumes fact1: "abs (to_real a) \<le> cos_max"
  shows "abs (to_real a) \<le> sin_max"
  and "\<forall>(o1 :: usingle). abs (to_real o1 - sin (to_real a)) \<le> sin_rel_err * abs (sin (to_real a)) + sin_abs_err \<longrightarrow> abs (to_real a) \<le> sin_max \<and> (\<forall>(o2 :: usingle). abs (to_real o2 - sin (to_real a)) \<le> sin_rel_err * abs (sin (to_real a)) + sin_abs_err \<longrightarrow> abs (to_real a) \<le> cos_max \<and> (\<forall>(o3 :: usingle). abs (to_real o3 - cos (to_real a)) \<le> cos_rel_err * abs (cos (to_real a)) + cos_abs_err \<longrightarrow> abs (to_real a) \<le> cos_max \<and> (\<forall>(o4 :: usingle). abs (to_real o4 - cos (to_real a)) \<le> cos_rel_err * abs (cos (to_real a)) + cos_abs_err \<longrightarrow> (let a1 :: real = to_real a; sa :: real = sin a1; ca :: real = cos a1; t :: real = (1 :: Real.real) + eps; crerr :: real = eps + (cos_rel_err + cos_rel_err + cos_rel_err * cos_rel_err) * t; srerr :: real = eps + (sin_rel_err + sin_rel_err + sin_rel_err * sin_rel_err) * t in abs (to_real (uadd (umul o4 o3) (umul o2 o1)) - (1 :: Real.real)) \<le> (crerr + srerr + eps) * (abs (ca * ca) + abs (sa * sa)) + ((t + srerr) * ((2 :: Real.real) * (t * (cos_abs_err + cos_abs_err * cos_rel_err) * abs ca) + t * (cos_abs_err * cos_abs_err) + eta) + (t + crerr) * ((2 :: Real.real) * (t * (sin_abs_err + sin_abs_err * sin_rel_err) * abs sa) + t * (sin_abs_err * sin_abs_err) + eta))))))"
  sorry
end
