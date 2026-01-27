theory fibonacci_Mat22_Unit_def_l
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t = t'mk (a11: "int") (a12: "int") (a21: "int") (a22: "int")
definition mult :: "t \<Rightarrow> t \<Rightarrow> t"
  where "mult x y = t'mk (a11 x * a11 y + a12 x * a21 y) (a11 x * a12 y + a12 x * a22 y) (a21 x * a11 y + a22 x * a21 y) (a21 x * a12 y + a22 x * a22 y)" for x y
theorem Unit_def_l:
  fixes x :: "t"
  shows "mult (t'mk (1 :: int) (0 :: int) (0 :: int) (1 :: int)) x = x"
  sorry
end
