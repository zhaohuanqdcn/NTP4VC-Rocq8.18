theory sin_cos_SinCosSingle_kinematicsqtvc
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
theorem kinematics'vc:
  fixes theta1 :: "usingle"
  fixes theta2 :: "usingle"
  assumes fact0: "abs (to_real theta1) \<le> (1 :: Real.real) / (4) * sin_max"
  assumes fact1: "abs (to_real theta2) \<le> (1 :: Real.real) / (4) * sin_max"
  shows "let o1 :: usingle = uadd theta1 theta2 in abs (to_real o1) \<le> sin_max \<and> (\<forall>(o2 :: usingle). abs (to_real o2 - sin (to_real o1)) \<le> sin_rel_err * abs (sin (to_real o1)) + sin_abs_err \<longrightarrow> (\<forall>(o3 :: usingle). to_real o3 = (5 :: Real.real) / (2) \<longrightarrow> abs (to_real theta1) \<le> sin_max \<and> (\<forall>(o4 :: usingle). abs (to_real o4 - sin (to_real theta1)) \<le> sin_rel_err * abs (sin (to_real theta1)) + sin_abs_err \<longrightarrow> (\<forall>(o5 :: usingle). to_real o5 = (1 :: Real.real) / (2) \<longrightarrow> (let theta11 :: real = to_real theta1; theta21 :: real = to_real theta2; t1 :: real = (1 :: Real.real) + eps; t2 :: real = eps + sin_rel_err * t1 in abs (to_real (uadd (umul o5 o4) (umul o3 o2)) - ((1 :: Real.real) / (2) * sin theta11 + (5 :: Real.real) / (2) * sin (theta11 + theta21))) \<le> ((2 :: Real.real) * t2 + eps) * ((1 :: Real.real) / (2) * abs (sin theta11) + (5 :: Real.real) / (2) * abs (sin (theta11 + theta21))) + (t1 + t2) * (t1 * ((1 :: Real.real) / (2) * sin_abs_err + (5 :: Real.real) / (2) * (eps * abs (theta11 + theta21) * ((1 :: Real.real) + sin_rel_err) + sin_abs_err)) + (2 :: Real.real) * eta))))))"
  sorry
end
