theory tower_of_hanoi_Tower_of_Hanoi_Trans
  imports "NTP4Verif.NTP4Verif"
begin
theorem Trans:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  assumes fact0: "x < y"
  assumes fact1: "y < z"
  shows "x < z"
  sorry
end
