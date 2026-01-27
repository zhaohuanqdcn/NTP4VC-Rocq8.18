theory induction_Induction2_G
  imports "NTP4Verif.NTP4Verif" "./induction_Hyps"
begin
axiomatization where Induction:   "p n"
 if "\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < n \<longrightarrow> p k) \<longrightarrow> p n"
 and "(0 :: int) \<le> n"
  for n :: "int"
axiomatization where Induction_bound:   "p n"
 if "\<forall>(n :: int). (0 :: int) \<le> n \<longrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < n \<longrightarrow> p k) \<longrightarrow> p n"
 and "(0 :: int) \<le> n"
  for n :: "int"
theorem G:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "p n"
  sorry
end
