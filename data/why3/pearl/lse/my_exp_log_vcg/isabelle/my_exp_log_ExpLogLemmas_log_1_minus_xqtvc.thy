theory my_exp_log_ExpLogLemmas_log_1_minus_xqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem log_1_minus_x'vc:
  fixes x :: "real"
  assumes fact0: "(0 :: Real.real) \<le> x"
  assumes fact1: "x < (1 :: Real.real)"
  shows "ln ((1 :: Real.real) + x) \<le> -ln ((1 :: Real.real) - x)"
  sorry
end
