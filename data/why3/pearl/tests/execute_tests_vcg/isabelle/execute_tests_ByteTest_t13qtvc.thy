theory execute_tests_ByteTest_t13qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t13'vc:
  shows "\<not>(2 :: int) = (0 :: int)"
  and "uint'8_in_bounds ((24 :: int) cdiv (2 :: int))"
  and "\<forall>(o1 :: 8 word). uint o1 = (24 :: int) cdiv (2 :: int) \<longrightarrow> uint'8_in_bounds ((42 :: int) + uint o1) \<and> (\<forall>(z :: 8 word). uint z = (42 :: int) + uint o1 \<longrightarrow> uint'8_in_bounds (uint z * (42 :: int)) \<and> (\<forall>(w :: 8 word). uint w = uint z * (42 :: int) \<longrightarrow> \<not>(10 :: int) = (0 :: int) \<and> uint'8_in_bounds (uint w cmod (10 :: int))))"
  sorry
end
