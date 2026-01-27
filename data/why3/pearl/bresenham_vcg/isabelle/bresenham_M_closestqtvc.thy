theory bresenham_M_closestqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition best :: "int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "best x2 y2 x y \<longleftrightarrow> (\<forall>(y' :: int). abs (x2 * y - x * y2) \<le> abs (x2 * y' - x * y2))" for x2 y2 x y
theorem closest'vc:
  fixes a :: "int"
  fixes b :: "int"
  fixes c :: "int"
  fixes b' :: "int"
  assumes fact0: "abs ((2 :: int) * a * b - (2 :: int) * c) \<le> a"
  shows "abs (a * b - c) \<le> abs (a * b' - c)"
  sorry
end
