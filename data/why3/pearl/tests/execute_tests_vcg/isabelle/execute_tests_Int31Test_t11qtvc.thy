theory execute_tests_Int31Test_t11qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t11'vc:
  shows "int'31_in_bounds ((21 :: int) - (1 :: int))"
  and "sint (20 :: 31 word) = (21 :: int) - (1 :: int) \<longrightarrow> ((20 :: int) = sint (20 :: 31 word) \<longrightarrow> True) \<longrightarrow> int'31_in_bounds ((21 :: int) - (1 :: int))"
  sorry
end
