theory dreal_Power_G2_KO
  imports "NTP4Verif.NTP4Verif"
begin
theorem G2_KO:
  fixes x :: "real"
  assumes fact0: "(2 :: Real.real) < x"
  shows "(5 :: Real.real) < x"
  sorry
end
