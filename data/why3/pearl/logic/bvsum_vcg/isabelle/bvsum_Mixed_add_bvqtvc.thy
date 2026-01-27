theory bvsum_Mixed_add_bvqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem add_bv'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "x + y = (x AND y) + (x OR y)"
  sorry
end
