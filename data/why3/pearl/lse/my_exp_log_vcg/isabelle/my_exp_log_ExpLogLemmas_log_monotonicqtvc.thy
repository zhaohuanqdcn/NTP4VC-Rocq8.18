theory my_exp_log_ExpLogLemmas_log_monotonicqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem log_monotonic'vc:
  fixes x :: "real"
  fixes y :: "real"
  assumes fact0: "(0 :: Real.real) < x"
  assumes fact1: "x \<le> y"
  shows "ln x \<le> ln y"
  sorry
end
