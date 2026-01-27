theory verifythis_2021_lexicographic_permutations_2_BoxedIntArrays_boxed_permutqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
definition boxed :: "int \<Rightarrow> int list \<Rightarrow> _"
  where "boxed u a \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> (2 :: int) * abs (a ! nat i) < u)" for u a
theorem boxed_permut'vc:
  fixes u :: "int"
  fixes a :: "int list"
  fixes a' :: "int list"
  assumes fact0: "boxed u a"
  assumes fact1: "a <~~> a'"
  shows "boxed u a'"
  sorry
end
