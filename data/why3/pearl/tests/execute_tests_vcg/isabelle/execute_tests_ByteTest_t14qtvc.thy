theory execute_tests_ByteTest_t14qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t14'vc:
  shows "uint'8_in_bounds (42 :: int)"
  and "\<forall>(x :: 8 word). uint x = (42 :: int) \<longrightarrow> (let y :: int = uint x in uint'8_in_bounds y \<and> (\<forall>(o1 :: 8 word). uint o1 = y \<longrightarrow> uint'8_in_bounds (uint x + uint o1)))"
  sorry
end
