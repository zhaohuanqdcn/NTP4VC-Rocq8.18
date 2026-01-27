theory my_exp_log_ExpLogLemmas_exp_invqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem exp_inv'vc:
  fixes x :: "real"
  assumes fact0: "\<not>x = (0 :: Real.real)"
  shows "exp (-x) = (1 :: Real.real) / exp x"
  sorry
end
