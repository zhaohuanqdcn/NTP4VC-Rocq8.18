theory test_elim_MatchPair_g
  imports "NTP4Verif.NTP4Verif"
begin
theorem g:
  fixes x :: "int"
  shows "case (x, x + (1 :: int)) of (a, b) \<Rightarrow> a < b"
  sorry
end
