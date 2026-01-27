theory sin_cos_SinCosSingle_raytracerqtvc
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
theorem raytracer'vc:
  fixes phi :: "usingle"
  fixes theta :: "usingle"
  fixes nz :: "usingle"
  fixes ny :: "usingle"
  fixes nx :: "usingle"
  assumes fact0: "abs (to_real phi) \<le> sin_max"
  assumes fact1: "abs (to_real phi) \<le> cos_max"
  assumes fact2: "abs (to_real theta) \<le> sin_max"
  assumes fact3: "abs (to_real theta) \<le> cos_max"
  shows "abs (to_real phi) \<le> sin_max"
  and "\<forall>(o1 :: usingle). abs (to_real o1 - sin (to_real phi)) \<le> sin_rel_err * abs (sin (to_real phi)) + sin_abs_err \<longrightarrow> abs (to_real theta) \<le> cos_max \<and> (\<forall>(o2 :: usingle). abs (to_real o2 - cos (to_real theta)) \<le> cos_rel_err * abs (cos (to_real theta)) + cos_abs_err \<longrightarrow> abs (to_real theta) \<le> sin_max \<and> (\<forall>(o3 :: usingle). abs (to_real o3 - sin (to_real theta)) \<le> sin_rel_err * abs (sin (to_real theta)) + sin_abs_err \<longrightarrow> abs (to_real phi) \<le> cos_max \<and> (\<forall>(o4 :: usingle). abs (to_real o4 - cos (to_real phi)) \<le> cos_rel_err * abs (cos (to_real phi)) + cos_abs_err \<longrightarrow> abs (to_real theta) \<le> cos_max \<and> (\<forall>(o5 :: usingle). abs (to_real o5 - cos (to_real theta)) \<le> cos_rel_err * abs (cos (to_real theta)) + cos_abs_err \<longrightarrow> (let nz1 :: real = to_real nz; ny1 :: real = to_real ny; nx1 :: real = to_real nx; phi1 :: real = to_real phi; theta1 :: real = to_real theta; t1 :: real = (1 :: Real.real) + eps; t2c :: real = eps + cos_rel_err * t1; t2s :: real = eps + sin_rel_err * t1; t3c :: real = eps + (t2c + cos_rel_err + t2c * cos_rel_err) * t1; t3s :: real = eps + (t2c + sin_rel_err + t2c * sin_rel_err) * t1; t4 :: real = t3c + t2s + eps in abs (to_real (uadd (uadd (umul (umul nx o5) o4) (umul ny o3)) (umul (umul nz o2) o1)) - (nx1 * cos theta1 * cos phi1 + ny1 * sin theta1 + nz1 * cos theta1 * sin phi1)) \<le> (t4 + t3s + eps) * (abs (nx1 * cos theta1 * cos phi1) + abs (ny1 * sin theta1) + abs (nz1 * cos theta1 * sin phi1)) + (t1 + t3s) * ((t1 + t2s) * (t1 * (cos_abs_err * ((1 :: Real.real) + t2c) * abs (nx1 * cos theta1) + (t1 * cos_abs_err * abs nx1 + eta) * (((1 :: Real.real) + cos_rel_err) * abs (cos phi1) + cos_abs_err)) + eta) + (t1 + t3c) * (t1 * sin_abs_err * abs ny1 + eta)) + (t1 + t4) * (t1 * (sin_abs_err * ((1 :: Real.real) + t2c) * abs (nz1 * cos theta1) + (t1 * cos_abs_err * abs nz1 + eta) * (((1 :: Real.real) + sin_rel_err) * abs (sin phi1) + sin_abs_err)) + eta))))))"
  sorry
end
