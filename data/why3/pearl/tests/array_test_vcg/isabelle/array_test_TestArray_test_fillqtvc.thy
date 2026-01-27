theory array_test_TestArray_test_fillqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test_fill'vc:
  shows "(0 :: int) \<le> (17 :: int)"
  and "\<forall>(a :: bool list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (17 :: int) \<longrightarrow> a ! nat i = True) \<and> int (length a) = (17 :: int) \<longrightarrow> (0 :: int) \<le> (10 :: int) \<and> (0 :: int) \<le> (4 :: int) \<and> (10 :: int) + (4 :: int) \<le> int (length a)"
  sorry
end
