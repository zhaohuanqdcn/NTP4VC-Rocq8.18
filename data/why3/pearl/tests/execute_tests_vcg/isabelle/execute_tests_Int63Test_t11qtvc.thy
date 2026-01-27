theory execute_tests_Int63Test_t11qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t11'vc:
  shows "int'63_in_bounds ((21 :: int) - (1 :: int))"
  and "sint (20 :: 63 word) = (21 :: int) - (1 :: int) \<longrightarrow> ((20 :: int) = sint (20 :: 63 word) \<longrightarrow> True) \<longrightarrow> int'63_in_bounds ((21 :: int) - (1 :: int))"
  sorry
end
