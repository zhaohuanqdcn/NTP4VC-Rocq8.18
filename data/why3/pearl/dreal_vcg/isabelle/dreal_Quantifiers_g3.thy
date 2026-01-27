theory dreal_Quantifiers_g3
  imports "NTP4Verif.NTP4Verif"
begin
consts g :: "int \<Rightarrow> int"
axiomatization where g_pos:   "(0 :: int) \<le> g z"
  for z :: "int"
consts h :: "int \<Rightarrow> int"
axiomatization where h_pos:   "(0 :: int) \<le> h x"
 if "(0 :: int) \<le> x"
  for x :: "int"
theorem g3:
  fixes x :: "int"
  shows "(0 :: int) \<le> h (g x)"
  sorry
end
