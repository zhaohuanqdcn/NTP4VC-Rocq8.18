theory division_HoareSound_A4
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where A1:   "x + y = y + x"
  for x :: "int"
  and y :: "int"
axiomatization where A2:   "x * y = y * x"
  for x :: "int"
  and y :: "int"
axiomatization where A3:   "x + y + z = x + (y + z)"
  for x :: "int"
  and y :: "int"
  and z :: "int"
theorem A4:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  shows "x * y * z = x * (y * z)"
  sorry
end
