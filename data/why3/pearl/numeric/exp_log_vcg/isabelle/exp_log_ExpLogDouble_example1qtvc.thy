theory exp_log_ExpLogDouble_example1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_UDouble" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_UDoubleLemmas"
begin
consts log_error :: "real"
axiomatization where log_error_bounds'0:   "(0 :: Real.real) \<le> log_error"
axiomatization where log_error_bounds'1:   "log_error \<le> (1 :: Real.real)"
consts log_cst_error :: "real"
axiomatization where log_cst_error_bounds'0:   "(0 :: Real.real) \<le> log_cst_error"
axiomatization where log_cst_error_bounds'1:   "log_cst_error \<le> (1 :: Real.real)"
consts log_approx :: "udouble \<Rightarrow> udouble"
axiomatization where log_approx'spec:   "abs (to_real (log_approx x) - ln (to_real x)) \<le> abs (ln (to_real x)) * log_error + log_cst_error"
 if "(0 :: Real.real) < to_real x"
  for x :: "udouble"
consts exp_error :: "real"
axiomatization where exp_error_bounds'0:   "(0 :: Real.real) \<le> exp_error"
axiomatization where exp_error_bounds'1:   "exp_error \<le> (1 :: Real.real) / (2)"
consts exp_approx :: "udouble \<Rightarrow> udouble"
axiomatization where exp_approx'spec:   "abs (to_real (exp_approx x) - exp (to_real x)) \<le> exp_error * exp (to_real x)"
  for x :: "udouble"
theorem example1'vc:
  fixes y :: "udouble"
  fixes x :: "udouble"
  shows "let o1 :: udouble = exp_approx y in abs (to_real o1 - exp (to_real y)) \<le> exp_error * exp (to_real y) \<longrightarrow> (0 :: Real.real) < to_real o1 \<and> (let o2 :: udouble = log_approx o1 in abs (to_real o2 - ln (to_real o1)) \<le> abs (ln (to_real o1)) * log_error + log_cst_error \<longrightarrow> (let o3 :: udouble = exp_approx x in abs (to_real o3 - exp (to_real x)) \<le> exp_error * exp (to_real x) \<longrightarrow> (0 :: Real.real) < to_real o3 \<and> (let o4 :: udouble = log_approx o3 in abs (to_real o4 - ln (to_real o3)) \<le> abs (ln (to_real o3)) * log_error + log_cst_error \<longrightarrow> (let t :: real = ln (exp (to_real y)); t1 :: real = ln (exp (to_real x)); t2 :: real = ((1 :: Real.real) + eps + log_error) * (-ln ((1 :: Real.real) - exp_error) * ((1 :: Real.real) + log_error) + log_cst_error) in abs (to_real (uadd o4 o2) - (t1 + t)) \<le> (log_error + log_error + eps) * (abs t1 + abs t) + (t2 + t2)))))"
  sorry
end
