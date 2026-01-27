theory random_test_Test_test1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.random_State" "Why3STD.random_Random"
begin
theorem test1'vc:
  shows "(0 :: int) < (10 :: int)"
  and "\<forall>(x :: int). (0 :: int) \<le> x \<and> x < (10 :: int) \<longrightarrow> (0 :: int) < (10 :: int)"
  sorry
end
