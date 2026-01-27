theory rac_Loops_test2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem test2'vc:
  assumes fact0: "(0 :: int) \<le> (5 :: int) + (1 :: int)"
  shows "True \<or> (0 :: int) = (1 :: int)"
  and "\<forall>(x :: int) (i :: int). ((0 :: int) \<le> i \<and> i \<le> (5 :: int)) \<and> (x = (0 :: int) \<or> x = (1 :: int)) \<longrightarrow> x + (1 :: int) = (0 :: int) \<or> x + (1 :: int) = (1 :: int)"
  sorry
end
