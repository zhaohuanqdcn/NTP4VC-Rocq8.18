theory matrix_test_TestMatrix_test1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.matrix_Matrix"
begin
theorem test1'vc:
  shows "(0 :: int) \<le> (3 :: int)"
  and "\<forall>(m1 :: int matrix). rows m1 = (3 :: int) \<and> columns m1 = (3 :: int) \<and> (\<forall>(i :: int) (j :: int). ((0 :: int) \<le> i \<and> i < (3 :: int)) \<and> (0 :: int) \<le> j \<and> j < (3 :: int) \<longrightarrow> elts m1 i j = (2 :: int)) \<longrightarrow> valid_index m1 (0 :: int) (0 :: int)"
  sorry
end
