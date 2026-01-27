theory my_exp_log_ExpLogLemmas_exp_monotonicqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem exp_monotonic'vc:
  fixes x :: "real"
  fixes y :: "real"
  assumes fact0: "x \<le> y"
  shows "exp x \<le> exp y"
  sorry
end
