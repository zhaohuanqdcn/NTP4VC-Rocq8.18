theory lineardecision_LinearDecisionInt_Mul_distr_r
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t' = IC "int" | Error
definition interp_id :: "t' \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp_id t x_v = (case t of IC i \<Rightarrow> i | Error \<Rightarrow> (0 :: int))" for t x_v
theorem Mul_distr_r:
  fixes y :: "int"
  fixes z :: "int"
  fixes x :: "int"
  shows "(y + z) * x = y * x + z * x"
  sorry
end
