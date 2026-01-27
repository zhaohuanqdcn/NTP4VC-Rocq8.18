theory division_HoareSound_A2
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where A1:   "x + y = y + x"
  for x :: "int"
  and y :: "int"
theorem A2:
  fixes x :: "int"
  fixes y :: "int"
  shows "x * y = y * x"
  sorry
end
