theory rac_Loops_test3qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem test3'vc:
  fixes x :: "int"
  shows "x \<le> (5 :: int)"
  and "\<forall>(x1 :: int). x1 \<le> (5 :: int) \<longrightarrow> x1 < (10 :: int) \<longrightarrow> ((0 :: int) \<le> (10 :: int) - x1 \<and> (10 :: int) - (x1 + (1 :: int)) < (10 :: int) - x1) \<and> x1 + (1 :: int) \<le> (5 :: int)"
  sorry
end
