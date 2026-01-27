theory array_test_TestArray_test_appendqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem test_append'vc:
  shows "(0 :: int) \<le> (17 :: int)"
  and "\<forall>(a1 :: int list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (17 :: int) \<longrightarrow> a1 ! nat i = (2 :: int)) \<and> int (length a1) = (17 :: int) \<longrightarrow> ((0 :: int) \<le> (3 :: int) \<and> (3 :: int) < int (length a1)) \<and> (length (a1[nat (3 :: int) := 4 :: int]) = length a1 \<longrightarrow> nth (a1[nat (3 :: int) := 4 :: int]) o nat = (nth a1 o nat)(3 :: int := 4 :: int) \<longrightarrow> (0 :: int) \<le> (25 :: int))"
  sorry
end
