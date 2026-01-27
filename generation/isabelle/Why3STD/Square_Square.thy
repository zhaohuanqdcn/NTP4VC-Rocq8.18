theory Square_Square
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where sqrt_lin1:   "sqrt x < x"
 if "(1 :: Real.real) < x"
  for x :: "real"
axiomatization where sqrt_lin0:   "x < sqrt x"
 if "(0 :: Real.real) < x"
 and "x < (1 :: Real.real)"
  for x :: "real"
axiomatization where sqrt_0:   "sqrt (0 :: Real.real) = (0 :: Real.real)"
axiomatization where sqrt_1:   "sqrt (1 :: Real.real) = (1 :: Real.real)"
end
