theory lineardecision_LinearDecisionInt_CompatOrderMult
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t' = IC "int" | Error
definition interp_id :: "t' \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp_id t x_v = (case t of IC i \<Rightarrow> i | Error \<Rightarrow> (0 :: int))" for t x_v
theorem CompatOrderMult:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  assumes fact0: "x \<le> y"
  assumes fact1: "(0 :: int) \<le> z"
  shows "x * z \<le> y * z"
  sorry
end
