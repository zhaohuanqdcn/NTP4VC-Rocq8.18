theory dreal_P_sqr_pos
  imports "NTP4Verif.NTP4Verif"
begin
definition sqr :: "real \<Rightarrow> real"
  where "sqr x = x * x" for x
theorem sqr_pos:
  fixes x :: "real"
  shows "(0 :: Real.real) \<le> sqr x"
  sorry
end
