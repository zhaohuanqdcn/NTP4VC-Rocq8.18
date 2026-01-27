theory binary_search_BinarySearchAnyMidPoint_binary_searchqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem binary_search'vc:
  fixes a :: "int list"
  fixes v :: "int"
  assumes fact0: "\<forall>(i1 :: int) (i2 :: int). (0 :: int) \<le> i1 \<and> i1 \<le> i2 \<and> i2 < int (length a) \<longrightarrow> a ! nat i1 \<le> a ! nat i2"
  shows "let o1 :: int = int (length a) - (1 :: int) in (((0 :: int) \<le> (0 :: int) \<and> o1 < int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> a ! nat i = v \<longrightarrow> (0 :: int) \<le> i \<and> i \<le> o1)) \<and> (\<forall>(u :: int) (l :: int). ((0 :: int) \<le> l \<and> u < int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> a ! nat i = v \<longrightarrow> l \<le> i \<and> i \<le> u) \<longrightarrow> (if l \<le> u then l \<le> u \<and> (\<forall>(m :: int). l \<le> m \<and> m \<le> u \<longrightarrow> ((0 :: int) \<le> m \<and> m < int (length a)) \<and> (if a ! nat m < v then ((0 :: int) \<le> u - l \<and> u - (m + (1 :: int)) < u - l) \<and> ((0 :: int) \<le> m + (1 :: int) \<and> u < int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> a ! nat i = v \<longrightarrow> m + (1 :: int) \<le> i \<and> i \<le> u) else ((0 :: int) \<le> m \<and> m < int (length a)) \<and> (if v < a ! nat m then ((0 :: int) \<le> u - l \<and> m - (1 :: int) - l < u - l) \<and> ((0 :: int) \<le> l \<and> m - (1 :: int) < int (length a)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> a ! nat i = v \<longrightarrow> l \<le> i \<and> i \<le> m - (1 :: int)) else ((0 :: int) \<le> m \<and> m < int (length a)) \<and> a ! nat m = v))) else \<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length a) \<longrightarrow> \<not>a ! nat i = v))"
  sorry
end
