theory induction_Induction1_base
  imports "NTP4Verif.NTP4Verif" "./induction_Hyps"
begin
definition pr :: "int \<Rightarrow> _"
  where "pr k \<longleftrightarrow> p k \<and> p (k + (1 :: int))" for k
theorem base:
  shows "pr (0 :: int)"
  sorry
end
