theory dreal_P3_MethodErrorOK
  imports "NTP4Verif.NTP4Verif"
begin
theorem MethodErrorOK:
  fixes x :: "real"
  assumes fact0: "abs x \<le> (1 :: Real.real) / (32)"
  shows "abs ((1 :: Real.real) - (1 :: Real.real) / (2) * (x * x) - cos x) \<le> (1 :: Real.real) / (16777216)"
  sorry
end
