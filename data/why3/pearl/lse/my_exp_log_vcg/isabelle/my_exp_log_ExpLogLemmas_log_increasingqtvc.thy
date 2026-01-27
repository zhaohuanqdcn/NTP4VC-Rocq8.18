theory my_exp_log_ExpLogLemmas_log_increasingqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem log_increasing'vc:
  fixes x :: "real"
  fixes y :: "real"
  assumes fact0: "(0 :: Real.real) < x"
  assumes fact1: "x < y"
  shows "ln x < ln y"
  sorry
end
