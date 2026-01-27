theory Cmath_Cmath
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where abs_def:   "if (0 :: int) \<le> x then abs x = x else abs x = -x"
  for x :: "int"
end
