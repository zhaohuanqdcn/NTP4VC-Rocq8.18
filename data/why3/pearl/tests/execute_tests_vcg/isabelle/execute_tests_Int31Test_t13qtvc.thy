theory execute_tests_Int31Test_t13qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t13'vc:
  shows "\<not>(2 :: int) = (0 :: int)"
  and "int'31_in_bounds ((24 :: int) cdiv (2 :: int))"
  and "\<forall>(o1 :: 31 word). sint o1 = (24 :: int) cdiv (2 :: int) \<longrightarrow> int'31_in_bounds ((42 :: int) + sint o1) \<and> (\<forall>(z :: 31 word). sint z = (42 :: int) + sint o1 \<longrightarrow> int'31_in_bounds (sint z * (42 :: int)) \<and> (\<forall>(w :: 31 word). sint w = sint z * (42 :: int) \<longrightarrow> (\<not>(10 :: int) = (0 :: int) \<and> int'31_in_bounds (sint w cmod (10 :: int))) \<and> (\<forall>(w1 :: 31 word). sint w1 = sint w cmod (10 :: int) \<longrightarrow> int'31_in_bounds (-sint w1))))"
  sorry
end
