theory min_max_Top_a_similar_min_maxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_min :: "int \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_min m a lo hi \<longleftrightarrow> (\<exists>(i :: int). (lo \<le> i \<and> i < hi \<and> hi \<le> int (length a)) \<and> a ! nat i = m) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> m \<le> a ! nat i)" for m a lo hi
definition is_max :: "int \<Rightarrow> int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_max m a lo hi \<longleftrightarrow> (\<exists>(i :: int). (lo \<le> i \<and> i < hi \<and> hi \<le> int (length a)) \<and> a ! nat i = m) \<and> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> a ! nat i \<le> m)" for m a lo hi
theorem a_similar_min_max'vc:
  fixes a :: "int list"
  assumes fact0: "(1 :: int) \<le> int (length a)"
  shows "let o1 :: int = int (length a) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < o1 \<and> o1 \<le> int (length a)) \<and> (\<forall>(x :: int) (y :: int). is_min x a (0 :: int) o1 \<and> is_max y a (0 :: int) o1 \<longrightarrow> is_min x a (0 :: int) (int (length a)) \<and> is_max y a (0 :: int) (int (length a)))"
  sorry
end
