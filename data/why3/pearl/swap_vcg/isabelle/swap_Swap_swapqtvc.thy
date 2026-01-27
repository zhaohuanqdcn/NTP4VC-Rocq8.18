theory swap_Swap_swapqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem swap'vc:
  fixes a :: "int"
  fixes b :: "int"
  shows "a + b - (a + b - b) = b"
  and "a + b - b = a"
  sorry
end
