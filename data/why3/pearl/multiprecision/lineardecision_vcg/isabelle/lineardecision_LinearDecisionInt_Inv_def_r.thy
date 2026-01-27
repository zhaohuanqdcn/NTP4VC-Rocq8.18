theory lineardecision_LinearDecisionInt_Inv_def_r
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t' = IC "int" | Error
definition interp_id :: "t' \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp_id t x_v = (case t of IC i \<Rightarrow> i | Error \<Rightarrow> (0 :: int))" for t x_v
theorem Inv_def_r:
  fixes x :: "int"
  shows "x + -x = (0 :: int)"
  sorry
end
