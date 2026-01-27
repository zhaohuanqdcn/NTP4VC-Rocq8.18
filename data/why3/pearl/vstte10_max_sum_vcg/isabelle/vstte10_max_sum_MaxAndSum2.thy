theory vstte10_max_sum_MaxAndSum2
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_Sum"
begin
definition is_max :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_max a l h m \<longleftrightarrow> (\<forall>(k :: int). l \<le> k \<and> k < h \<longrightarrow> a ! nat k \<le> m) \<and> (h \<le> l \<and> m = (0 :: int) \<or> l < h \<and> (\<exists>(k :: int). (l \<le> k \<and> k < h) \<and> m = a ! nat k))" for a l h m
end
