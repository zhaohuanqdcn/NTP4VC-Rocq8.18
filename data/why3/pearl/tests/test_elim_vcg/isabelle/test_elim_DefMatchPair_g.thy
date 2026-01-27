theory test_elim_DefMatchPair_g
  imports "NTP4Verif.NTP4Verif"
begin
definition f :: "int \<Rightarrow> _"
  where "f x \<longleftrightarrow> (case (x, x + (1 :: int)) of (a, b) \<Rightarrow> a < b)" for x
theorem g:
  fixes x :: "int"
  shows "f x"
  sorry
end
