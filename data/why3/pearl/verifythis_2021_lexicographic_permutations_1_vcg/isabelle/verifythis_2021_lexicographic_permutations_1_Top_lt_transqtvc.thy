theory verifythis_2021_lexicographic_permutations_1_Top_lt_transqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_NumOf"
begin
typedecl  elt
typedecl  permutation
definition lt :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "lt p q \<longleftrightarrow> (length p = length q \<and> (0 :: int) < int (length q)) \<and> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < int (length p)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> p ! nat j = q ! nat j) \<and> p ! nat i < q ! nat i)" for p q
theorem lt_trans'vc:
  fixes p :: "int list"
  fixes q :: "int list"
  fixes r :: "int list"
  assumes fact0: "lt p q"
  assumes fact1: "lt q r"
  shows "lt p r"
  sorry
end
