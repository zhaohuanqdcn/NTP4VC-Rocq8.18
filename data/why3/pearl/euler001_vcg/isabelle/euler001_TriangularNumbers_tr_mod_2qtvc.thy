theory euler001_TriangularNumbers_tr_mod_2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Div2" "./euler001_DivModHints"
begin
theorem tr_mod_2'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "n * (n + (1 :: int)) cmod (2 :: int) = (0 :: int)"
  sorry
end
