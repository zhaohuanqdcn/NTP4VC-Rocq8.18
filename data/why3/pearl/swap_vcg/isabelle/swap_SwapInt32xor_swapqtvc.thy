theory swap_SwapInt32xor_swapqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref"
begin
theorem swap'vc:
  fixes a :: "32 word"
  fixes b :: "32 word"
  shows "(a XOR b) XOR (a XOR b) XOR b = b"
  and "(a XOR b) XOR b = a"
  sorry
end
