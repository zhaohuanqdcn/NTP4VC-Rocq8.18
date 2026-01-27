theory execute_tests_ByteTest_t11qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t11'vc:
  shows "uint'8_in_bounds ((21 :: int) - (1 :: int))"
  and "uint (20 :: 8 word) = (21 :: int) - (1 :: int) \<longrightarrow> ((20 :: int) = uint (20 :: 8 word) \<longrightarrow> True) \<longrightarrow> uint'8_in_bounds ((21 :: int) - (1 :: int))"
  sorry
end
