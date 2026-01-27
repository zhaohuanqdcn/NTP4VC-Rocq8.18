theory dreal_P3_cos_bound
  imports "NTP4Verif.NTP4Verif"
begin
theorem cos_bound:
  fixes x :: "real"
  shows "-(1 :: Real.real) \<le> cos x"
  and "cos x \<le> (1 :: Real.real)"
  sorry
end
