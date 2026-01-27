theory test_elim_UnusedAbs_fqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem f'vc:
  fixes x :: "int"
  shows "x < x + (1 :: int)"
  sorry
end
