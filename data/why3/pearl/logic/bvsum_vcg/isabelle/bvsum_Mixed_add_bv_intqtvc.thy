theory bvsum_Mixed_add_bv_intqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem add_bv_int'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "uint x + uint y = uint (x AND y) + uint (x OR y)"
  sorry
end
