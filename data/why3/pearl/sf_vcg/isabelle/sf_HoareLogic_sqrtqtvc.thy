theory sf_HoareLogic_sqrtqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
inductive even :: "int \<Rightarrow> bool" where
   even_0: "even (0 :: int)"
 | even_odd: "even x \<Longrightarrow> even (x + (2 :: int))" for x :: "int"
theorem sqrt'vc:
  fixes x :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) * (0 :: int) \<le> x"
  and "\<forall>(z :: int). (0 :: int) \<le> z \<and> z * z \<le> x \<longrightarrow> (if (z + (1 :: int)) * (z + (1 :: int)) \<le> x then ((0 :: int) \<le> x - z * z \<and> x - (z + (1 :: int)) * (z + (1 :: int)) < x - z * z) \<and> (0 :: int) \<le> z + (1 :: int) \<and> (z + (1 :: int)) * (z + (1 :: int)) \<le> x else z * z \<le> x \<and> x < (z + (1 :: int)) * (z + (1 :: int)))"
  sorry
end
