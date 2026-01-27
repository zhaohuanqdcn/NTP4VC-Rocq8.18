theory dreal_Quantifiers_g2
  imports "NTP4Verif.NTP4Verif"
begin
consts g :: "int \<Rightarrow> int"
axiomatization where g_pos:   "(0 :: int) \<le> g z"
  for z :: "int"
theorem g2:
  shows "(0 :: int) \<le> g (3 :: int)"
  sorry
end
