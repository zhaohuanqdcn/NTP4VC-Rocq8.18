theory test_elim_Ref_fqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem f'vc:
  fixes x :: "int"
  shows "x < x + (1 :: int)"
  sorry
end
