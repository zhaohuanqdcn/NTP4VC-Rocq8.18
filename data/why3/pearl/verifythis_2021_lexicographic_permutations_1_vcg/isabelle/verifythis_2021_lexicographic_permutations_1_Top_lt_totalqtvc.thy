theory verifythis_2021_lexicographic_permutations_1_Top_lt_totalqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.int_NumOf"
begin
typedecl  elt
typedecl  permutation
definition lt :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "lt p q \<longleftrightarrow> (length p = length q \<and> (0 :: int) < int (length q)) \<and> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < int (length p)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> p ! nat j = q ! nat j) \<and> p ! nat i < q ! nat i)" for p q
theorem lt_total'vc:
  fixes p :: "int list"
  fixes q :: "int list"
  assumes fact0: "length p = length q"
  shows "let o1 :: int = int (length p) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> p ! nat j = q ! nat j) \<and> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> p ! nat j = q ! nat j) \<longrightarrow> (if p ! nat i < q ! nat i then lt p q else if q ! nat i < p ! nat i then p = q \<or> lt q p else \<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> p ! nat j = q ! nat j)) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> p ! nat j = q ! nat j) \<longrightarrow> p = q \<or> lt q p)) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> p = q \<or> lt q p)"
  sorry
end
