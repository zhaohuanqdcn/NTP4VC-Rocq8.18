theory binary_search_vc_sp_BinarySearchBoolean_binary_searchqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem binary_search'vc:
  fixes a :: "int list"
  assumes fact0: "(0 :: int) < int (length a)"
  assumes fact1: "\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i \<le> j \<and> j < int (length a) \<longrightarrow> (0 :: int) \<le> a ! nat i \<and> a ! nat i \<le> a ! nat j \<and> a ! nat j \<le> (1 :: int)"
  assumes fact2: "a ! nat (int (length a) - (1 :: int)) = (1 :: int)"
  shows "let o1 :: int = int (length a) - (1 :: int) in (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o1 \<and> o1 < int (length a)) \<and> a ! nat o1 = (1 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> a ! nat i = (0 :: int))) \<and> (\<forall>(lo :: int) (hi :: int). ((0 :: int) \<le> lo \<and> lo \<le> hi \<and> hi < int (length a)) \<and> a ! nat hi = (1 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < lo \<longrightarrow> a ! nat i = (0 :: int)) \<longrightarrow> (if lo < hi then (\<not>(2 :: int) = (0 :: int) \<and> (let mid :: int = lo + (hi - lo) cdiv (2 :: int) in (0 :: int) \<le> mid \<and> mid < int (length a))) \<and> (\<forall>(lo1 :: int) (hi1 :: int). (let mid :: int = lo + (hi - lo) cdiv (2 :: int) in if a ! nat mid = (1 :: int) then hi1 = mid \<and> lo1 = lo else lo1 = mid + (1 :: int) \<and> hi1 = hi) \<longrightarrow> ((0 :: int) \<le> hi - lo \<and> hi1 - lo1 < hi - lo) \<and> ((0 :: int) \<le> lo1 \<and> lo1 \<le> hi1 \<and> hi1 < int (length a)) \<and> a ! nat hi1 = (1 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < lo1 \<longrightarrow> a ! nat i = (0 :: int))) else ((0 :: int) \<le> lo \<and> lo < int (length a)) \<and> a ! nat lo = (1 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < lo \<longrightarrow> a ! nat i = (0 :: int))))"
  sorry
end
