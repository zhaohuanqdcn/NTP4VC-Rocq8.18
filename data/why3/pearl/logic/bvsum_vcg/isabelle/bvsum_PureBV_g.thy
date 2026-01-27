theory bvsum_PureBV_g
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem g:
  fixes x :: "32 word"
  fixes y :: "32 word"
  fixes z :: "32 word"
  shows "x + y + z = ((x AND y) + (x OR y) AND z) + ((x AND y) + (x OR y) OR z)"
  sorry
end
