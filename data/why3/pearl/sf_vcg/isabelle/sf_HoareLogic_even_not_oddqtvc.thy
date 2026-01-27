theory sf_HoareLogic_even_not_oddqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
inductive even :: "int \<Rightarrow> bool" where
   even_0: "even (0 :: int)"
 | even_odd: "even x \<Longrightarrow> even (x + (2 :: int))" for x :: "int"
theorem even_not_odd'vc:
  fixes x :: "int"
  shows "\<not>(even x \<and> even (x + (1 :: int)))"
  sorry
end
