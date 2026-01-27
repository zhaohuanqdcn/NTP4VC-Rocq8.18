theory euler001_TriangularNumbers_tr_reprqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Div2" "./euler001_DivModHints"
begin
definition tr :: "int \<Rightarrow> int"
  where "tr n = n * (n + (1 :: int)) cdiv (2 :: int)" for n
theorem tr_repr'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "n * (n + (1 :: int)) = (2 :: int) * tr n"
  sorry
end
