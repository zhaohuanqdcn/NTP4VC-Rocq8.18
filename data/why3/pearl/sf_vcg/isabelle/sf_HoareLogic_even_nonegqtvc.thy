theory sf_HoareLogic_even_nonegqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
inductive even :: "int \<Rightarrow> bool" where
   even_0: "even (0 :: int)"
 | even_odd: "even x \<Longrightarrow> even (x + (2 :: int))" for x :: "int"
theorem even_noneg'vc:
  fixes x :: "int"
  assumes fact0: "even x"
  shows "(0 :: int) \<le> x"
  sorry
end
