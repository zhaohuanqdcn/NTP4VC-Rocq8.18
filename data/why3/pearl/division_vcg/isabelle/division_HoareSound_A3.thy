theory division_HoareSound_A3
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where A1:   "x + y = y + x"
  for x :: "int"
  and y :: "int"
axiomatization where A2:   "x * y = y * x"
  for x :: "int"
  and y :: "int"
theorem A3:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  shows "x + y + z = x + (y + z)"
  sorry
end
