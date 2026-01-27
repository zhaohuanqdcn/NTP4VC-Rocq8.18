theory execute_tests_ByteTest_t12qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t12'vc:
  shows "\<not>(2 :: int) = (0 :: int)"
  and "uint'8_in_bounds ((42 :: int) cmod (2 :: int))"
  sorry
end
