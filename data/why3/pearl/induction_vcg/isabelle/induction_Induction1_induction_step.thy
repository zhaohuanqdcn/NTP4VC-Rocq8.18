theory induction_Induction1_induction_step
  imports "NTP4Verif.NTP4Verif" "./induction_Hyps"
begin
definition pr :: "int \<Rightarrow> _"
  where "pr k \<longleftrightarrow> p k \<and> p (k + (1 :: int))" for k
axiomatization where base:   "pr (0 :: int)"
theorem induction_step:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "pr n"
  shows "pr (n + (1 :: int))"
  sorry
end
