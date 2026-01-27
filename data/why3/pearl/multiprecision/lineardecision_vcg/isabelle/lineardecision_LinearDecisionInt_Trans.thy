theory lineardecision_LinearDecisionInt_Trans
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t' = IC "int" | Error
definition interp_id :: "t' \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp_id t x_v = (case t of IC i \<Rightarrow> i | Error \<Rightarrow> (0 :: int))" for t x_v
theorem Trans:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  assumes fact0: "x \<le> y"
  assumes fact1: "y \<le> z"
  shows "x \<le> z"
  sorry
end
