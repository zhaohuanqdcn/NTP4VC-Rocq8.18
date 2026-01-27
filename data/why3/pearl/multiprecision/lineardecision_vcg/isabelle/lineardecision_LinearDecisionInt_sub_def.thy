theory lineardecision_LinearDecisionInt_sub_def
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t' = IC "int" | Error
definition interp_id :: "t' \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp_id t x_v = (case t of IC i \<Rightarrow> i | Error \<Rightarrow> (0 :: int))" for t x_v
theorem sub_def:
  fixes a1 :: "int"
  fixes a2 :: "int"
  shows "a1 - a2 = a1 + -a2"
  sorry
end
