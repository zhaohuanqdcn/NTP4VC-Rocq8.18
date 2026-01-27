theory test_elim_UnusedBV_fqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem f'vc:
  fixes x :: "32 word"
  assumes fact0: "(1000 :: 32 word) > x"
  shows "x + (1 :: 32 word) > x"
  sorry
end
