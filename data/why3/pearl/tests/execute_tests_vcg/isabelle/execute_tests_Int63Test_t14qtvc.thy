theory execute_tests_Int63Test_t14qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t14'vc:
  shows "int'63_in_bounds (42 :: int)"
  and "\<forall>(x :: 63 word). sint x = (42 :: int) \<longrightarrow> (let y :: int = sint x in int'63_in_bounds y \<and> (\<forall>(o1 :: 63 word). sint o1 = y \<longrightarrow> int'63_in_bounds (sint x + sint o1)))"
  sorry
end
