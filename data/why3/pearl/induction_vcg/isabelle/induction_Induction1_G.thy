theory induction_Induction1_G
  imports "NTP4Verif.NTP4Verif" "./induction_Hyps"
begin
definition pr :: "int \<Rightarrow> _"
  where "pr k \<longleftrightarrow> p k \<and> p (k + (1 :: int))" for k
axiomatization where base:   "pr (0 :: int)"
axiomatization where induction_step:   "pr (n + (1 :: int))"
 if "(0 :: int) \<le> n"
 and "pr n"
  for n :: "int"
axiomatization where SimpleInduction:   "pr n"
 if "(0 :: int) \<le> n"
  for n :: "int"
theorem G:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "p n"
  sorry
end
