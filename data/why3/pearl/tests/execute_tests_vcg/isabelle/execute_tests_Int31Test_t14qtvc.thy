theory execute_tests_Int31Test_t14qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t14'vc:
  shows "int'31_in_bounds (42 :: int)"
  and "\<forall>(x :: 31 word). sint x = (42 :: int) \<longrightarrow> (let y :: int = sint x in int'31_in_bounds y \<and> (\<forall>(o1 :: 31 word). sint o1 = y \<longrightarrow> int'31_in_bounds (sint x + sint o1)))"
  sorry
end
