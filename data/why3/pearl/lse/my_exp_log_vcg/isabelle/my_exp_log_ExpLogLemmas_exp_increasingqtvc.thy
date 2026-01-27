theory my_exp_log_ExpLogLemmas_exp_increasingqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem exp_increasing'vc:
  fixes x :: "real"
  fixes y :: "real"
  assumes fact0: "x < y"
  shows "exp x < exp y"
  sorry
end
