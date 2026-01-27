theory space_saving_Top_minimumqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
typedecl  elt
consts dummy :: "elt"
theorem minimum'vc:
  fixes a :: "int list"
  assumes fact0: "(0 :: int) < int (length a)"
  shows "let o1 :: int = int (length a) - (1 :: int) in ((1 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < int (length a)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (1 :: int) \<longrightarrow> a ! (0 :: nat) \<le> a ! nat j)) \<and> (\<forall>(m :: int). (\<forall>(i :: int). ((1 :: int) \<le> i \<and> i \<le> o1) \<and> ((0 :: int) \<le> m \<and> m < int (length a)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> a ! nat m \<le> a ! nat j) \<longrightarrow> ((0 :: int) \<le> m \<and> m < int (length a)) \<and> ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (if a ! nat i < a ! nat m then ((0 :: int) \<le> i \<and> i < int (length a)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> a ! nat i \<le> a ! nat j) else ((0 :: int) \<le> m \<and> m < int (length a)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> a ! nat m \<le> a ! nat j))) \<and> (((0 :: int) \<le> m \<and> m < int (length a)) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> a ! nat m \<le> a ! nat j) \<longrightarrow> ((0 :: int) \<le> m \<and> m < int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> a ! nat m \<le> a ! nat i)))) \<and> (o1 + (1 :: int) < (1 :: int) \<longrightarrow> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> a ! (0 :: nat) \<le> a ! nat i))"
  sorry
end
