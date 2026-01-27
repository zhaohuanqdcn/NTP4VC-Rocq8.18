theory euler001_DivModHints_div2_addqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem div2_add'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "x cmod (2 :: int) = (0 :: int)"
  assumes fact1: "y cmod (2 :: int) = (0 :: int)"
  shows "(x + y) cdiv (2 :: int) = x cdiv (2 :: int) + y cdiv (2 :: int)"
  sorry
end
