theory fibonacci_Mat22_Assoc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t = t'mk (a11: "int") (a12: "int") (a21: "int") (a22: "int")
definition mult :: "t \<Rightarrow> t \<Rightarrow> t"
  where "mult x y = t'mk (a11 x * a11 y + a12 x * a21 y) (a11 x * a12 y + a12 x * a22 y) (a21 x * a11 y + a22 x * a21 y) (a21 x * a12 y + a22 x * a22 y)" for x y
theorem Assoc:
  fixes x :: "t"
  fixes y :: "t"
  fixes z :: "t"
  shows "mult (mult x y) z = mult x (mult y z)"
  sorry
end
