theory bresenham_M_bresenhamqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition best :: "int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "best x2 y2 x y \<longleftrightarrow> (\<forall>(y' :: int). abs (x2 * y - x * y2) \<le> abs (x2 * y' - x * y2))" for x2 y2 x y
theorem bresenham'vc:
  fixes y2 :: "int"
  fixes x2 :: "int"
  assumes fact0: "(0 :: int) \<le> y2"
  assumes fact1: "y2 \<le> x2"
  shows "let o1 :: int = (2 :: int) * y2 - x2 in (0 :: int) \<le> x2 + (1 :: int) \<longrightarrow> (o1 = (2 :: int) * ((0 :: int) + (1 :: int)) * y2 - ((2 :: int) * (0 :: int) + (1 :: int)) * x2 \<and> (2 :: int) * (y2 - x2) \<le> o1 \<and> o1 \<le> (2 :: int) * y2) \<and> (\<forall>(e :: int) (y :: int) (x :: int). ((0 :: int) \<le> x \<and> x \<le> x2) \<and> e = (2 :: int) * (x + (1 :: int)) * y2 - ((2 :: int) * y + (1 :: int)) * x2 \<and> (2 :: int) * (y2 - x2) \<le> e \<and> e \<le> (2 :: int) * y2 \<longrightarrow> (if e < (0 :: int) then e + (2 :: int) * y2 = (2 :: int) * (x + (1 :: int) + (1 :: int)) * y2 - ((2 :: int) * y + (1 :: int)) * x2 \<and> (2 :: int) * (y2 - x2) \<le> e + (2 :: int) * y2 \<and> e + (2 :: int) * y2 \<le> (2 :: int) * y2 else e + (2 :: int) * (y2 - x2) = (2 :: int) * (x + (1 :: int) + (1 :: int)) * y2 - ((2 :: int) * (y + (1 :: int)) + (1 :: int)) * x2 \<and> (2 :: int) * (y2 - x2) \<le> e + (2 :: int) * (y2 - x2) \<and> e + (2 :: int) * (y2 - x2) \<le> (2 :: int) * y2))"
  sorry
end
