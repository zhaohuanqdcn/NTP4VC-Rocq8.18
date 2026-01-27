theory execute_tests_Int31Test_t12qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem t12'vc:
  shows "\<not>(2 :: int) = (0 :: int)"
  and "int'31_in_bounds ((42 :: int) cmod (2 :: int))"
  sorry
end
