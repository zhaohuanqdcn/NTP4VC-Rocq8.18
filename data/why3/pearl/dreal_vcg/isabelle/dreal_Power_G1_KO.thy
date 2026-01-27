theory dreal_Power_G1_KO
  imports "NTP4Verif.NTP4Verif"
begin
theorem G1_KO:
  fixes x :: "real"
  assumes fact0: "(2 :: Real.real) < x"
  shows "(20 :: Real.real) < x powr (3 :: Real.real) * (2 :: Real.real)"
  sorry
end
