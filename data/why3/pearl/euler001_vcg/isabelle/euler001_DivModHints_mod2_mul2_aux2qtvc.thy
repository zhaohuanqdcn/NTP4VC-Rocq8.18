theory euler001_DivModHints_mod2_mul2_aux2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem mod2_mul2_aux2'vc:
  fixes y :: "int"
  fixes x :: "int"
  fixes z :: "int"
  fixes t :: "int"
  shows "(y * ((2 :: int) * x) + z * ((2 :: int) * t)) cmod (2 :: int) = (0 :: int)"
  sorry
end
