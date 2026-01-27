theory dreal_Misc_exp_limit_funqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem exp_limit_fun'vc:
  fixes x :: "real"
  assumes fact0: "abs x \<le> (25 :: Real.real)"
  shows "exp x \<le> (72004899338 :: Real.real)"
  sorry
end
