theory rac_Loops_test1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem test1'vc:
  assumes fact0: "(1 :: int) \<le> (10 :: int) + (1 :: int)"
  shows "(0 :: int) < (1 :: int)"
  and "(1 :: int) \<le> (10 :: int)"
  and "\<forall>(i :: int). ((1 :: int) \<le> i \<and> i \<le> (10 :: int)) \<and> (0 :: int) < i \<and> i \<le> (10 :: int) \<longrightarrow> (0 :: int) < i + (1 :: int) \<and> i + (1 :: int) \<le> (10 :: int)"
  sorry
end
