theory euler001_TriangularNumbers_tr_succqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_Div2" "./euler001_DivModHints"
begin
definition tr :: "int \<Rightarrow> int"
  where "tr n = n * (n + (1 :: int)) cdiv (2 :: int)" for n
theorem tr_succ'vc:
  fixes n :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  shows "tr (n + (1 :: int)) = tr n + n + (1 :: int)"
  sorry
end
