theory division_HoareSound_A6
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
axiomatization where A4:   "x * y * z = x * (y * z)"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where A5:   "x * (y + z) = x * y + x * z"
  for x :: "int"
  and y :: "int"
  and z :: "int"
theorem A6:
  fixes y :: "int"
  fixes x :: "int"
  assumes fact0: "y \<le> x"
  shows "x - y + y = x"
  sorry
end
