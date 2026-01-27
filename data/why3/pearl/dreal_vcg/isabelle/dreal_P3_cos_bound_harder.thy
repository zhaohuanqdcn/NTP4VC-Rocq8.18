theory dreal_P3_cos_bound_harder
  imports "NTP4Verif.NTP4Verif"
begin
theorem cos_bound_harder:
  fixes x :: "real"
  assumes fact0: "-((7 :: Real.real) / (10)) \<le> x"
  assumes fact1: "x \<le> (7 :: Real.real) / (10)"
  shows "(7 :: Real.real) / (10) \<le> cos x"
  and "cos x \<le> (1 :: Real.real)"
  sorry
end
