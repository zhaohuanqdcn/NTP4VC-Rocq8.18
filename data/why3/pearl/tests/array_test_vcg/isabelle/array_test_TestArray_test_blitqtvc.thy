theory array_test_TestArray_test_blitqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test_blit'vc:
  shows "(0 :: int) \<le> (17 :: int)"
  and "\<forall>(a1 :: bool list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (17 :: int) \<longrightarrow> a1 ! nat i = True) \<and> int (length a1) = (17 :: int) \<longrightarrow> (0 :: int) \<le> (25 :: int) \<and> (\<forall>(a2 :: bool list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (25 :: int) \<longrightarrow> a2 ! nat i = False) \<and> int (length a2) = (25 :: int) \<longrightarrow> ((0 :: int) \<le> (10 :: int) \<and> (0 :: int) \<le> (7 :: int) \<and> (10 :: int) + (7 :: int) \<le> int (length a1)) \<and> (0 :: int) \<le> (17 :: int) \<and> (17 :: int) + (7 :: int) \<le> int (length a2))"
  sorry
end
