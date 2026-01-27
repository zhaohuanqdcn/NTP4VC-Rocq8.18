theory algo63_Algo63_partitionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "Why3STD.map_MapExchange" "Why3STD.map_MapPermut"
begin
theorem partition'vc:
  fixes m :: "int"
  fixes n :: "int"
  fixes a :: "int list"
  assumes fact0: "(0 :: int) \<le> m"
  assumes fact1: "m < n"
  assumes fact2: "n < int (length a)"
  shows "(0 :: int) \<le> m"
  and "m < n"
  and "n < int (length a)"
  and "\<forall>(o1 :: int) (j :: int) (i :: int) (a1 :: int list). length a1 = length a \<longrightarrow> (m \<le> j \<and> j < i \<and> i \<le> n) \<and> permut_sub' a a1 (nat m) (nat (n + (1 :: int))) \<and> (\<forall>(r :: int). m \<le> r \<and> r \<le> j \<longrightarrow> a1 ! nat r \<le> o1) \<and> (\<forall>(r :: int). j < r \<and> r < i \<longrightarrow> a1 ! nat r = o1) \<and> (\<forall>(r :: int). i \<le> r \<and> r \<le> n \<longrightarrow> o1 \<le> a1 ! nat r) \<longrightarrow> (m \<le> j \<and> j < i \<and> i \<le> n) \<and> permut_sub' a a1 (nat m) (nat (n + (1 :: int))) \<and> (\<exists>(x :: int). (\<forall>(r :: int). m \<le> r \<and> r \<le> j \<longrightarrow> a1 ! nat r \<le> x) \<and> (\<forall>(r :: int). j < r \<and> r < i \<longrightarrow> a1 ! nat r = x) \<and> (\<forall>(r :: int). i \<le> r \<and> r \<le> n \<longrightarrow> x \<le> a1 ! nat r))"
  sorry
end
